class ArticlesController < ApplicationController
  include ArticlesHelper
  include SessionsHelper

  def index
    if params[:category]
      @articles = Article.where(:category => params[:category]).order('num_likes desc')
    else
      @articles = Article.all.order('num_likes desc')
    end
  end

  def show
    authenciate
    @article = Article.find(params[:id])
    @nearbys = @article.nearbys(10)
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    authenciate
    @article = Article.new
  end

  def create
    authenciate
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    @article.save
    if ! @article.errors.any?
      flash.notice = "'#{@article.title}' was created!"
      redirect_to articles_path
    else
      render:new
    end

  end

  def destroy
    authenciate
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      flash.notice = "'#{@article.title}' was successfully destroyed."
      format.html { redirect_to articles_path }
    end
  end

  def edit
    authenciate
    @article = Article.find(params[:id])
  end

  def update
    authenciate
    @article = Article.find(params[:id])
    @article.update article_params
    # flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end

  def add_like
    authenciate
    @article = Article.find(params[:id])
    new_Num = @article.num_likes.nil? ? 1: @article.num_likes
    new_Num+=1
    @article.update_attribute("num_likes", new_Num )

    respond_to do |format|
      msg = { :status => "ok", :message => new_Num }
      format.json  { render :json => msg } # don't do msg.to_json
    end

  end

end
