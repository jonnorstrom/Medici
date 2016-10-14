class UsersMailer < ApplicationMailer
  default from: "Admin@medicimuseums.com"
  include ActionView::Helpers::UrlHelper

  def signup_email(user)
    @user = user
    attachments.inline['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/Medici_logos/Medici_logo_CMYK_sm.png")
    mail(from: 'MediciMuseums <admin@medicimuseums.com>', to: @user.email, subject: 'Welcom to Medici!')
  end

end
