class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    generic_callback( 'facebook' )
  end

  def generic_callback( provider )
    @identity = Identity.find_for_oauth env["omniauth.auth"]
    p "IDENTITY IN GENERIC CALLBACK"
    p @identity
    @user = @identity.user || current_user

    if @user.nil?
      p "IN 'IF USER.NIL?' CONDITIONAL"
      @user = User.new( email: @identity.email || "", full_name: @identity.name, image_url: @identity.image )
      p "HERE'S THE USER ERRORS"
      @user.save
      @user.errors.full_messages.each do |m|
        p m
      end
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email)
    end

    if @user.persisted?
      p "IN 'IF USER.PERSISTED?' CONDITIONAL"
      @identity.update_attribute( :user_id, @user.id )
      # This is because we've created the user manually, and Device expects a
      # FormUser class (with the validations)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      p "IN ELSE STATEMENT - USER.PERSISTED? FAILED"
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
