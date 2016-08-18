class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tickets = current_order.tickets.where(paid: false)
    @total_num = @tickets.inject(0) {|sum, ticket| sum + ticket.total_price}
    @total = '%.2f' % @total_num
    @charge = Charge.new
  end


end
