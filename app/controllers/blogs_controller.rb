class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def new

  end

  def show
    @blog = Blog.find(params[:title])
  end

  def create

  end

end
