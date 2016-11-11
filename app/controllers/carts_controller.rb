class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tickets = current_order.tickets.where(paid: false)
    @total_num = @tickets.inject(0) do |sum, ticket|
      # if ticket.total_price.nil?
      #   sum + (ticket.unit_price * ticket.quantity)
      # else
        sum + ticket.total_price
      # end
    end
    @total_num
    @total = '%.2f' % @total_num
    @charge = Charge.new
  end
end
