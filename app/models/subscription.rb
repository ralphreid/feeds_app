class Subscription < ActiveRecord::Base

  attr_accessible :category, :feed_id, :user_id

  validates :category, presence: true

  belongs_to :feed
  belongs_to :user

  def self.add_feed_to_user_subscriptions(feed_id, user_id, category_from_user) # reminder: user_id to be grabbed from current_user.id
    subscription = Subscription.where(:feed_id => feed_id, :user_id => user_id).first_or_create # avoiding duplicates!
    subscription.category = category_from_user
    subscription.save
  end

  def self.remove_feed_from_user_subscriptions(feed_id, user_id)
    subscription = Subscription.where(:feed_id => feed_id, :user_id => user_id).first # find entry where feed_id and user_id match
    subscription.destroy
  end

  def self.list_all_subscribed_feeds(user_id)
    subscribed_feeds = Subscription.where(:user_id => user_id) # search result returns an array
  end

end
