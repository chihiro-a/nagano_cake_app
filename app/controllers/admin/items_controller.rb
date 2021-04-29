class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!, [:index,:show,:edit,:new]
  # ログインしていない場合アクセス不可

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
    # 商品詳細へ
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end

end
