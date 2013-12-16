class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :description, :job_description, :image, :linked_in, :kind, group_ids: []) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end

  def authenticate_admin_user!
    return @current_user if defined?(@current_user) && current_user.somekind_of_admin?      
  end
  
  def require_some_admin
    if current_user && current_user.somekind_of_admin?
      return true
    else
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

end
