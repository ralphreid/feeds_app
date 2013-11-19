class FeedsController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def show
    @feed = Feed.find params[:id]
    Article.get_articles_from_feed(@feed)
    @articles = @feed.articles
  end

  def subscribe
    category_from_user = "Testing" # need a form to take this field
    Subscription.add_feed_to_user_subscriptions(params[:id], current_user.id, category_from_user)
    redirect_to feed_path(params[:id])
  end

  def unsubscribe
    Subscription.remove_feed_from_user_subscriptions(params[:id], current_user.id)
    redirect_to feed_path(params[:id])
  end

end

