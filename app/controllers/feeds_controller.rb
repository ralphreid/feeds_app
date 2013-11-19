class FeedsController < ActionController::Base
  load_and_authorize_resource

  def index
    
  end

  def show
    # Article.get_articles_from_feed(@feed)
    @articles = Article.where(:feed_id)
  end
  
end

