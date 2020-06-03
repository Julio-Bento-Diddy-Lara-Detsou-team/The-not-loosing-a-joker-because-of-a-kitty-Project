class ItemsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
    flash.now[:notice] = "Ceci est un exemple de notification que vous pouvez utiliser !"
  end

  def show
    @item = Item.find(params[:id])
  end

  # TODO: Think about putting the methods below into an AdminItemsController

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
