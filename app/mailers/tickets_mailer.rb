class TicketsMailer < ApplicationMailer
  default from: 'tickets@medici-app.com'

  def purchase_email(user)
    @user = user
    @ticket = Ticket.where(user_id: @user.id).last
    @url  = "localhost:3000/tickets/#{@ticket.id}"
    @code = @ticket.redemption_code
    @museum = Museum.find(@ticket.museum_id)
    mail(to: @user.email, subject: 'Thanks for buying that ticket, dog')
  end

end
