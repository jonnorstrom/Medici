class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
    @coupon = Coupon.new
  end

  def create
    cp = params[:coupon]
    @coupon = Coupon.new({code: cp[:code], discount_percent: cp[:discount_percent].to_f, expires_at: cp[:expires_at]})
    if @coupon.save
      redirect_to coupons_path
    else
      @coupon_errors = @coupon.errors.full_messages
      render :index
    end
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def update
    cp = params[:coupon]
    @coupon = Coupon.find(params[:id])
    @coupon.update({code: cp[:code], discount_percent: cp[:discount_percent].to_f, expires_at: cp[:expires_at], active: cp[:active]})
    redirect_to coupons_path
  end

  def delete
  end

  private

  # def coupon_params
  #   params.require(:coupon).permit(:code, :discount_percent, :expires_at)
  # end
end
