require "spec_helper"

describe Label do
  describe "list_all_archived_articles" do
    let!(:user) { User.create(first_name: "bob", last_name: "bond", email: "bob@bob.com", password: "password") }
    let!(:feed) { Feed.create(title: "feed title") }

    it "should list all articles" do
      article_1 = Article.create(title: "article title 1", link: "link 1")
      article_2 = Article.create(title: "article title 2", link: "link 2")
      feed.articles << article_1
      feed.articles << article_2

      Label.archive_article(article_1.id, user.id)
      Label.archive_article(article_2.id, user.id)

      article_1.reload
      article_2.reload

      label_1 = article_1.labels.first
      label_2 = article_2.labels.first

      Label.list_all_archived_articles(user.id).should == [label_1, label_2]
    end
  end


  describe "list_all_bookmarked_articles" do
    let!(:user) { User.create(first_name: "bob", last_name: "bond", email: "bob@bob.com", password: "password") }
    let!(:feed) { Feed.create(title: "feed title") }

    it "should list all bookmarked articles" do
      article_1 = Article.create(title: "article title 1", link: "link 1")
      article_2 = Article.create(title: "article title 2", link: "link 2")
      feed.articles << article_1
      feed.articles << article_2

      Label.bookmark_article(article_1.id, user.id)
      Label.bookmark_article(article_2.id, user.id)

      article_1.reload
      article_2.reload

      label_1 = article_1.labels.first
      label_2 = article_2.labels.first

      Label.list_all_bookmarked_articles(user.id).should == [label_1, label_2]
    end
  end
end