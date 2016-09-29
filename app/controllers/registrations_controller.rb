class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters_update, :configure_permitted_parameters_signup

 def configure_permitted_parameters_update
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
 end
 def configure_permitted_parameters_signup
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
 end

  def update_resource(resource, params)
    if resource.encrypted_password.blank? # || params[:password].blank?
      resource.email = params[:email] if params[:email]
      resource.name = params[:name] if params[:name]
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
end
