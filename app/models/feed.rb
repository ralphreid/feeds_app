class Feed < ActiveRecord::Base

  attr_accessible :title, :link, :rss, :provider, :category, :description, :image_link, :image_title, :guid, :last_modified

  validates_uniqueness_of :guid

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  has_many :articles
  has_many :users, :through => :subscriptions
  # has_many :subscriptions?

  def self.get_feed(rss)
    feed = Feedzirra::Feed.fetch_and_parse(rss)
    add_feed(feed)
  end

  private

  def self.add_feed(feed)
    Feed.create!(
      :title        => feed.title,
      :rss      => feed.feed_url,
      :link         => feed.url,
      :guid         => feed.etag,
      :last_modified => feed.last_modified
      )
  end

end
