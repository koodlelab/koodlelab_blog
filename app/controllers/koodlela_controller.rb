class KoodlelaController < ApplicationController
  before_action :validate_login, only: [:index, :destroy]

  def index
    @blogs = Blog.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end

  def new

  end

  def edit

  end

  def update

  end

  def create
    user = User.find_by_user_name(params[:admin_session][:user_name])
    if user && user.authenticate(params[:admin_session][:password])
      session[:user_id] = user.id
      redirect_to koodlela_path
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  private
    def validate_login
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
