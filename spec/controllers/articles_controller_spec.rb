require "spec_helper"

describe ArticlesController do
  describe "archive" do
    let!(:user) { User.create(first_name: "bob", last_name: "bond", email: "bob@bob.com", password: "password") }
    let!(:feed) { Feed.create(title: "feed title") }
    let!(:article) { Article.create(title: "article title") }

    before(:each) do
      sign_in user
    end

    it "should show article" do
      article_1 = Article.create(title: "article title 1", link: "link 1")
      article_2 = Article.create(title: "article title 2", link: "link 2")
      article_3 = Article.create(title: "article title 3", link: "link 3")
      feed.articles << article_1
      feed.articles << article_2
      feed.articles << article_3

      get :show, feed_id: feed.id, id: article_2.id


      expect(assigns[:previous_article_id]).to eq(article_1.id)
      expect(assigns[:next_article_id]).to eq(article_3.id)
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

    it "should list my bookmarks" do
      article = Article.create(title: "article title 1", link: "link 1")
      feed.articles << article

      get :bookmark, feed_id: feed.id, id: article.id
      get :my_bookmarks

      expect(assigns[:my_bookmarks].first).to eq(Label.list_all_bookmarked_articles(user.id).first.article)
    end
  end
end