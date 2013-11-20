class ArticlesController < ApplicationController

  def show
    @article = Article.find params[:id]
  end

  def archive
    Label.archive_article(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def unarchive
    Label.unarchive_article(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def bookmark
    Label.bookmark_article(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

  def unbookmark
    Label.unbookmark_article(params[:id], current_user.id)

    output = {'status' => 'ok'}.to_json
    render json: output
  end

end
