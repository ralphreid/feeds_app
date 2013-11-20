class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.find params[:id]
    Article.get_articles_from_feed(@feed)
    @articles = @feed.articles
  end

  def subscribe
    category_from_user = "Testing" # need a form to take this field
    Subscription.add_feed_to_user_subscriptions(params[:id], current_user.id, category_from_user)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def unsubscribe
    Subscription.remove_feed_from_user_subscriptions(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def hide_on_profile
    Subscription.hide_subscribed_feed_on_user_profile(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def show_on_profile
    Subscription.show_subscribed_feed_on_user_profile(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

end

