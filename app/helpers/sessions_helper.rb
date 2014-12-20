module SessionsHelper
  def log_in(user)
    flash[:success] = "Hi, #{user.name}!" 
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def signed_in_user
    redirect_to root_path if logged_in?
  end

  def not_signed_in
    redirect_to root_path unless logged_in?
  end

  def admin?
    @current_user.admin == true
  end

  def user_is_admin
    unless logged_in? && current_user.admin?
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end
end
