class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :confirmable,
         :confirm_within => 1.hour

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :bio, :image, :role
  # attr_accessible :title, :body

  # non-Devise fields; need custom validation
  # validates :first_name, presence: true, length: { minimum: 2 }
  # validates :last_name, presence: true
  # validates :role, presence: true

  has_many :tags, :dependent => :destroy
  has_many :subscriptions, :dependent => :destroy # should have subscriptions too if we're adding a through relationship
  has_many :articles, :through => :tags
  has_many :feeds, :through => :subscriptions

end
