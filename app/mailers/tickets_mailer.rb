class TicketsMailer < ApplicationMailer
  default from: "Admin@medicimuseums.com"
  include ActionView::Helpers::UrlHelper

  def purchase_email(user)
    @user = user
    attachments.inline['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/Medici_logos/Medici_logo_CMYK_sm.png")
    @ticket = Ticket.where(user_id: @user.id).last
    @quantity = @ticket.quantity
    @total = 10 * @quantity
    @url  = tickets_redeem_url(@ticket)
    @code = @ticket.redemption_code
    if @ticket.exhibit_id != nil
      @museum = Exhibit.find(@ticket.exhibit_id).name
    elsif @ticket.event_id != nil
      @museum = Event.find(@ticket.event_id).name
    else
      @museum = Museum.find(@ticket.museum_id).name
    end
    mail(from: 'MediciMuseums <admin@medicimuseums.com>', to: @user.email, subject: 'Thanks for purchasing your ticket to Emoji Mystery!')
  end

end
