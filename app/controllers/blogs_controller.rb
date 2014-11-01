class BlogsController < ApplicationController

  def index
    @blogs = Blog.order('id DESC').paginate(page: params[:page], per_page: 5)
  end

  def new

  end

  def create

  end

end
