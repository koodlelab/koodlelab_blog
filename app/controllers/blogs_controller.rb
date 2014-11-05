class BlogsController < ApplicationController
  before_action :validate_login, only: [:new, :edit, :update, :destroy, :create]

  def index
    @blogs = Blog.order('created_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:title])
  end

  def create
    @blog = Blog.new(user_params)
    if @blog.save
      redirect_to koodlela_url
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:title])
  end

  def update
    @blog = Blog.find(params[:title])
    if @blog.update_attributes(user_params)
      flash[:success] = 'Blog updated'
      redirect_to @blog
    else
      render 'edit'
    end

  end

  def destroy
    Blog.find(params[:title]).destroy
    flash[:success] = "Blog deleted"
    redirect_to koodlela_path
  end

  private

    def user_params
      params.require(:blog).permit(:title, :body)
    end

    def validate_login
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
