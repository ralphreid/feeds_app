class Feed < ActiveRecord::Base

  attr_accessible :title, :link, :rss, :provider, :category, :description, :image_link, :image_title

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  has_many :articles
  has_many :users, :through => :subscriptions
  # has_many :subscriptions?

end
