class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items.each do |item|
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def update
    @item = Item.find(params[:id])
    @item.update
  end
end