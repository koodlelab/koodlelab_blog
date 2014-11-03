module KoodlelaHelper

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def logout
    session.delete(:user_id)
  end
end
