
class Feed < ActiveRecord::Base

  attr_accessible :title, :link, :rss, :provider, :category, :description, :image_link, :image_title, :guid, :last_modified

  validates_uniqueness_of :rss

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  has_many :articles
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  def self.get_feed(rss, category)
    feed = Feedzirra::Feed.fetch_and_parse(rss)
    add_feed(feed, category)
  end


  def self.add_feed(feed, category=nil)
    unless feed == 0
      f = Feed.where(:rss => feed.feed_url).first_or_create
      f.title = feed.title
      f.rss = feed.feed_url
      f.link = feed.url
      f.guid = feed.etag
      f.last_modified = feed.last_modified
      f.category = category
      f.save!
    end
  end

  def self.check_for_update_feed(feed)
    feed = Feedzirra::Feed.fetch_and_parse(feed.rss)
    updated_feed = Feedzirra::Feed.update(feed)
  end

  def images_from_readable
    parsed_document.images
  end

  def parsed_document
    @parsed_document ||= Readability::Document.new(open(link).read)
  end

end
