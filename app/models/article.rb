require 'open-uri'

class Article < ActiveRecord::Base

  attr_accessible :title, :content, :link, :description, :author, :comment_link, :posted_at, :feed_id

  validates_uniqueness_of :link

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  belongs_to :feed
  has_many :labels
  has_many :users, :through => :labels

  def self.get_articles_from_feed(feed)
    from_feed = Feedzirra::Feed.fetch_and_parse(feed.rss)
    add_articles(from_feed.entries, feed.id)
  end


  def self.add_articles(articles, feed_id)
    articles.each do |article|
      a = Article.where(:link => article.url).first_or_create
      a.title = article.title
      a.description = article.summary
      a.content = article.content
      a.link = article.url
      a.posted_at = article.published
      a.author = article.author
      a.feed_id = feed_id
      a.save!
    end
  end

  def content_from_readable
    parsed_document.content
  end

  def images_from_readable
    parsed_document.images
  end

  def parsed_document
    @parsed_document ||= Readability::Document.new(open(link).read)
  end

end

