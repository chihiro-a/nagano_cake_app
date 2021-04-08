class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to "/"
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :prace, :genre, :is_actuve)
  end

end
