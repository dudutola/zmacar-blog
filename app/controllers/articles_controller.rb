# frozen_string_literal: true

# ApplicationController is the base controller from which all other
# controllers in the application inherit. It sets up common behavior
# for the entire application, such as parameter sanitization for Devise.
class ArticlesController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    redirect_to @article.url
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      reader :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      reader :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image_url)
  end

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
  end
end
