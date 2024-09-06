# frozen_string_literal: true

# ApplicationController is the base controller from which all other
# controllers in the application inherit. It sets up common behavior
# for the entire application, such as parameter sanitization for Devise.
class ArticlesController < ApplicationController
  before_action :authentificate_user, only: %i[new create]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    redirect_to @article.url
  end
end
