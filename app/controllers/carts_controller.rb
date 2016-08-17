class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tickets = current_order.tickets
    @total = @tickets.inject(0) {|sum, ticket| sum + ticket.total_price}
  end

end
