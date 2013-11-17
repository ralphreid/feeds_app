class Subscription < ActiveRecord::Base

  attr_accessible :category

  validates :category, presence: true

  belongs_to :feed
  belongs_to :user

end
