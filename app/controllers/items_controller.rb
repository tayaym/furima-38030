class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:show, :index]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit]

  def index
    @items = Item.all.order("created_at DESC")

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

  def edit
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def contributor_confirmation
    redirect_to root_path if current_user != @item.user || @item.order.present?
  end

  def item_params
    params.require(:item).permit(:name, :image, :profile, :category_id, :state_id, :delivery_id, :region_id, :time_count_id, :price, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def article_params
  #   params.require(:article).permit(:name, :profile, :category_id, :state_id, :delivery_id, :region_id, :time_count_id, :price)
  # end

  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end

end