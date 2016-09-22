class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order, :resource_name, :resource, :devise_mapping
  before_filter :store_location, :unless => :devise_controller?

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.original_fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def current_order
    if session[:order_id]
      Order.new
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_admin?
    current_user.admin if current_user
  end

  def administrative
    if not is_admin?
     redirect_to root_url
   end
  end

  def store_current_location
    store_location_for(:user, request.url)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
