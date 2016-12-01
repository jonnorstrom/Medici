class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    generic_callback( 'facebook' )
  end

  def generic_callback( provider )
    p "MADE IT TO GENERIC CALLBACK\n\n=============================================\n\n============================================="
    @identity = Identity.find_for_oauth env["omniauth.auth"]
    p "#{@identity.email} - email & #{@identity.name} - name"
    @user = @identity.user || current_user
    p @user
    if @user.nil?
      @user = User.create( email: @identity.email || "", full_name: @identity.name, image_url: @identity.image )
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user.id )
      # This is because we've created the user manually, and Device expects a
      # FormUser class (with the validations)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
