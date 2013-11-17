class Article < ActiveRecord::Base

  attr_accessible :title, :content, :link, :description, :author, :comment_link

  # not sure what/if any validation is required if we're pulling all these fields' data from RSS

  belongs_to :feed
  has_many :tags
  has_many :users, :through => :tags

end
