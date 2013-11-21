class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def public_home
    #render public home page
  end

  def categories
    @feeds = Feed.where("category LIKE ?", "%#{params[:category]}%")
  end

  def new
    @feed = Feed.new
    @category_new = ""
  end

  def create
    @feed = Feed.new(params[:feed])
    @feed.category = params[:category_new].downcase if params[:category_new].present? && params[:feed][:category].empty?
    if Feed.get_feed(@feed.rss, @feed.category) # i.e. if this feed can be saved successfully
      @feed = Feed.last # need to re-get @feed so that there's an ID (which only becomes available after save)
      redirect_to feed_path(@feed), notice: 'Feed added!'
    else
      render :new
    end
  end


  def show
    begin
      @feed = Feed.find params[:id]
      Article.get_articles_from_feed(@feed)
      @articles = @feed.articles
    rescue ActiveRecord::RecordNotFound
      redirect_to feed_not_found_path
    end
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

  def find
    if params[:title]
      @feeds = Feed.where("title LIKE ? AND category LIKE ?", "%#{params[:title]}%", "%#{params[:category]}%")
    else
      @feed = Feed.new
    end
  end
end

