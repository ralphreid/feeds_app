class ArticlesController < ApplicationController

  def show
    @article = Article.find params[:id]

    # determine 'next post' link (assumes all records sequential and nothing missing)
    if Article.where(:id => (params[:id].to_i + 1), :feed_id => params[:feed_id]).present?
      @next_article_id = params[:id].to_i + 1
    else
      @next_article_id = nil
    end

    # determine 'previous post' link (assumes all records sequential and nothing missing)
    if Article.where(:id => (params[:id].to_i - 1), :feed_id => params[:feed_id]).present?
      @previous_article_id = params[:id].to_i - 1
    else
      @previous_article_id = nil
    end
  end

  def my_bookmarks
    page = params[:page] || 1
    per_page = 20

    @my_bookmarks = current_user.articles.where("bookmark = true").paginate(page: page, per_page: per_page).order('posted_at DESC').all if user_signed_in?
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
