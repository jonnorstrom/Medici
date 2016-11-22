class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @ticket = Ticket.find(params[:id])
    if @ticket.exhibit_id != nil
      @tweetable_museum = Museum.find(@ticket.museum_id).name
      @ticketed_post = @ticket.exhibit
    elsif @ticket.event_id != nil
      @tweetable_museum = @ticket.event.name
      @ticketed_post = @ticket.event
    else
      @tweetable_museum = Museum.find(@ticket.museum_id).name
      @ticketed_post = @ticket.museum
    end
    @ticket_code = @ticket.redemption_code
  end

  def create
    @order = current_order
    @ticket = @order.tickets.new(create_ticket_params)
    prng = Random.new
    @ticket.redemption_code = prng.rand(1000000000000).to_s + "MD101"
    @ticket.user_id = current_user.id
    @ticket.update(original_quantity: @ticket.quantity, user_id: current_user.id)
    @order.save
    session[:order_id] = @order.id
    redirect_to cart_path(id: current_user.id)
  end

  def redeem
    @ticket = Ticket.find(params[:id])
    if @ticket.redeemed == true
      redirect_to tickets_whoops_path
    else
      @ticket.update(redeemed: true)
      puts @ticket.errors.full_messages
      redirect_to tickets_thanks_path
    end
  end

  def thanks
  end

  def stats
    @tickets = Ticket.where(paid:true)
    if @tickets.count > 1
      @tickets = @tickets.sort {|x, y| x.user.name <=> y.user.name}
    else
      @tickets = @tickets.first
    end
    @game_id = Event.find_by(name: "Museum Game Night: Emoji Mystery").id
    @party_id = Event.find_by(name: "Party with Medici Museums").id
    @game_night = []
    @party_night = []

    @tickets.each do |t|
      if t.event_id == @game_id
        @game_night << t
      end
    end

    @tickets.each do |t|
      if t.event_id == @party_id
        @party_night << t
      end
    end
    
    @users = User.all.sort {|x, y| x.created_at <=> y.created_at}
  end


  def update
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.update_attributes(ticket_params)
    @ticket.update(original_quantity: @ticket.quantity)
    @tickets = @order.tickets
    redirect_to new_charge_path
  end

  def apply_coupons
    @order = current_order
    @tickets = @order.tickets
    params[:tickets].each do |k, v|
      @tickets.find(k.to_i).update_attributes(update_ticket_params(k))
    end
    redirect_to new_charge_path
  end

  def destroy
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.destroy
    @tickets = @order.tickets
    redirect_to cart_path(id: current_user.id)
  end

  private

    def create_ticket_params()
      params.require(:ticket).permit(:user_id, :quantity, :exhibit_id, :event_id, :original_quantity, :museum_id, :coupon_code)
    end

    def update_ticket_params(id)
      params.require(:tickets).require(id).permit(:user_id, :quantity, :exhibit_id, :event_id, :original_quantity, :museum_id, :coupon_code)
    end

end
