class TicketsMailer < ApplicationMailer
  default from: "MediciTickets@poptarts.com"
  include ActionView::Helpers::UrlHelper

  def purchase_email(user)
    @user = user
    attachments.inline['logo.jpg'] = File.read("#{Rails.root}/app/assets/images/giphy.gif")
    @ticket = Ticket.where(user_id: @user.id).last
    @url  = tickets_redeem_url(@ticket)
    @code = @ticket.redemption_code
    if @ticket.exhibit_id != nil
      @museum = Exhibit.find(@ticket.exhibit_id).name
    elsif @ticket.event_id != nil
      @museum = Event.find(@ticket.event_id).name
    else
      @museum = Museum.find(@ticket.museum_id).name
    end
    mail(to: @user.email, subject: 'Thanks for buying that ticket, dog')
  end

end
