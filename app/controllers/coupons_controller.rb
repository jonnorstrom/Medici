class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to coupons_path
    else
      @coupon_errors = @coupon.errors.full_messages
      render :index
    end
  end

  def update
  end

  def delete
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code, :discount_percent, :expires_at)
  end
end
