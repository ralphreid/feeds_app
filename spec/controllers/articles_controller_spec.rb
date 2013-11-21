require "spec_helper"

describe ArticlesController do
  describe "archive" do
    let!(:user) { User.create(first_name: "bob", last_name: "bond", email: "bob@bob.com", password: "password") }
    let!(:feed) { Feed.create(title: "feed title") }
    let!(:article) { Article.create(title: "article title") }

    before(:each) do
      sign_in user
    end

    it "should archive articles" do
      feed.articles << article
      expect(article.labels).to eq([])

      get :archive, feed_id: feed.id, id: article.id

      article.reload
      label = Label.first
      expect(article.labels).to eq([label])
      expect(label.archive).to eq(true)
    end

    it "should unarchive articles" do
      feed.articles << article
      get :archive, feed_id: feed.id, id: article.id

      # UNARCHIVE ARTICLE
      get :unarchive, feed_id: feed.id, id: article.id

      article.reload
      label = article.labels.first
      expect(label.archive).to eq(false)
    end
  end

  describe "bookmark" do
    let!(:user) { User.create(first_name: "bob", last_name: "bond", email: "bob@bob.com", password: "password") }
    let!(:feed) { Feed.create(title: "feed title") }
    let!(:article) { Article.create(title: "article title") }

    before(:each) do
      sign_in user
    end

    it "should bookmark articles" do
      feed.articles << article
      expect(article.labels).to eq([])

      get :bookmark, feed_id: feed.id, id: article.id

      article.reload
      label = Label.first
      expect(article.labels).to eq([label])
      expect(label.bookmark).to eq(true)
    end

    it "should unbookmark articles" do
      feed.articles << article
      get :bookmark, feed_id: feed.id, id: article.id

      # UNARCHIVE ARTICLE
      get :unbookmark, feed_id: feed.id, id: article.id

      article.reload
      label = article.labels.first
      expect(label.bookmark).to eq(false)
    end
  end
end