class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :timeoutable,
          :omniauthable,
          :omniauth_providers => [:google_oauth2]
         # , :confirmable, :confirm_within => 1.hour

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :bio, :image, :role
  # attr_accessible :title, :body

  # non-Devise fields; need custom validation
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true
  # validates :role, presence: true

  has_many :labels, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy # should have subscriptions too if we're adding a through relationship
  has_many :articles, :through => :labels
  has_many :feeds, :through => :subscriptions

  before_validation :assign_default_role

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)  # auth[:info][:email] because hashymash is used
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      user = User.where(auth.slice(:provider, :uid)).first_or_create do |user|
        binding.pry
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        #may be used with image in carrier wave
        # user.image = auth.image
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user
      end
      # user.save(:validate => false)
      # user
    end
  end

  private

    def assign_default_role
      self.role = "user" if self.role.nil?
    end
end
