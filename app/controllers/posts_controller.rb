class PostsController < ApplicationController
  def index
    @posts = Post.all.take(5)
  end
end

