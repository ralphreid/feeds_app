class ArticlesController < ActionController::Base
  load_and_authorize_resource

  def show
    @article = Article.find params[:id]
  end

end
