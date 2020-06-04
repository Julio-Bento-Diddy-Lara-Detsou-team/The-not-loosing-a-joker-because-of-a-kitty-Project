class ItemsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [:index, :show]
  before_action :create_session_cart

  def index
    @items = Item.all
    @categories = Category.all
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
