module TicketHelper

  def total_tickets(museum)
    @total = []
      Ticket.all.where(museum_id: museum.id).each do |ticket|
        @total << ticket.original_quantity
      end
    @total.inject(0, :+)
  end

  def total_redeemed(museum)
    @total = []
      Ticket.all.where(museum_id: museum.id).each do |ticket|
        if ticket.redeemed == true
          @total << ticket.original_quantity
        end
      end
    @total.inject(0, :+)
  end

end
