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
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true
  validates :role, presence: true

end
