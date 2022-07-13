class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderAddress.new
  end

  def create
    @order_form = OrderAddress.new(order_params)
    if @order_form.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_05c5cf09605929681d2d0372"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end