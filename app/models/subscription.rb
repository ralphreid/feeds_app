class Subscription < ActiveRecord::Base

  attr_accessible :category, :feed_id, :user_id

  validates :category, presence: true

  belongs_to :feed
  belongs_to :user

  def self.add_feed_to_user_subscriptions(feed_id, user_id, category_from_user) # reminder: user_id to be grabbed from current_user.id
    Subscription.create!(
      :feed_id => feed_id,
      :user_id => user_id,
      :category => category_from_user
    )
  end

  def self.remove_feed_from_user_subscriptions(feed_id, user_id)
    subscription = Subscription.where(:feed_id => feed_id, :user_id => user_id) # find entry where feed_id and user_id match
    subscription.destroy_all # need destroy_all instead of destroy for a collection
  end

end
