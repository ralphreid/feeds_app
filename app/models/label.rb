class Label < ActiveRecord::Base

  attr_accessible :archive, :bookmark, :article_id, :user_id

  # validates_inclusion_of :archive, :in => [true, false]
  # validates_inclusion_of :bookmark, :in => [true, false]

  belongs_to :user
  belongs_to :article

  def self.archive_article(article_id, user_id)
    label = Label.where(:article_id => article_id, :user_id => user_id).first_or_create # avoiding duplicates!
    label.archive = true
    label.save
  end

  def self.unarchive_article(article_id, user_id)
    label = Label.where(:article_id => article_id, :user_id => user_id).first # search result comes back as an array; need .first to get the hash
    label.archive = false
    label.save
  end

  def self.list_all_archived_articles(user_id)
    archived_articles = Label.where(:user_id => user_id, :archive => true) # search result comes back as an array
  end

  def self.bookmark_article(article_id, user_id)
    label = Label.where(:article_id => article_id, :user_id => user_id).first_or_create # avoiding duplicates!
    label.bookmark = true
    label.save
  end

  def self.unbookmark_article(article_id, user_id)
    label = Label.where(:article_id => article_id, :user_id => user_id).first # search result comes back as an array; need .first to get the hash
    label.bookmark = false
    label.save
  end

  def self.list_all_bookmarked_articles(user_id)
    bookmarked_articles = Label.where(:user_id => user_id, :bookmark => true) # search result comes back as an array
  end

end
