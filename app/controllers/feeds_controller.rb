class FeedsController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def show
    @feed = Feed.find params[:id]
    Article.get_articles_from_feed(@feed)
    @articles = @feed.articles
  end

end

