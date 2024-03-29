class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :search_product, only: [:index, :search]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def search
    @results = @p.result  #検索結果を取得
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :category_id, :item_state_id, :paying_for_shipping_id,
                                 :shipping_area_id, :shipping_day_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @item.order.present? || current_user.id != @item.user_id
  end

  def search_product
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  # def search_product
  #   @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  # end

end
