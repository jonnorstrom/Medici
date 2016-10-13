class UsersMailer < ApplicationMailer
  default from: "Admin@medicimuseums.com"
  include ActionView::Helpers::UrlHelper

  def signup_email(user)
    @user = user
    mail(from: 'MediciMuseums <admin@medicimuseums.com>', to: @user.email, subject: 'Thanks for signing up for Medici Museums!')
  end

end
