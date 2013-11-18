class Article < ActiveRecord::Base

  attr_accessible :title, :content, :link, :description, :author, :comment_link, :posted_at, :feed_id

  validates_uniqueness_of :link

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  belongs_to :feed
  has_many :tags
  has_many :users, :through => :tags

  def self.get_articles_from_feed(feed)
    from_feed = Feedzirra::Feed.fetch_and_parse(feed.rss)
    add_articles(from_feed.entries, feed.id)
  end


  def self.add_articles(articles, feed_id)
    articles.each do |article|
      Article.create!(
          :title         => article.title,
          :description      => article.summary,
          :content   => article.content,
          :link          => article.url,
          :posted_at => article.published,
          :author    => article.author,
          :feed_id   => feed_id
        )
    end
  end

end

