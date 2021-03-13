class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index]
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :region_id, :city, :street_address, :building,
                                       :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],
                                                            token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
  end
end
