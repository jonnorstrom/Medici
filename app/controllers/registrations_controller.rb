class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters_update, :configure_permitted_parameters_signup

 def configure_permitted_parameters_update
   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
 end

 def configure_permitted_parameters_signup
  #  devise_parameter_sanitizer.permit(:sign_up)
   devise_parameter_sanitizer.sanitize(:sign_up)
 end

  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      resource.first_name = params[:first_name] if params[:first_name]
      resource.last_name = params[:last_name] if params[:last_name]
      if !params[:password].blank? && params[:password] == params[:password_confirmation]
        logger.info "Updating password"
        resource.password = params[:password]
        resource.save
      end
      if resource.valid?
        resource.update_without_password(params)
      end
    else
      resource.update_with_password(params)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:full_name, :first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
