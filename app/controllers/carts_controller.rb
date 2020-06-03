class CartsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [:show, :remove_item]
  before_action :get_cart

  def create
    @cart = Cart.create(user: current_user())

    # Add new cart to user #TODO : Complete code below
    # current_user.cart = @cart
    # current_user.save
  end

  def show
    # Get user's item
    @item = Item.find(params[:id])

    # Get Cart
    @cart = get_cart

    # Add item to User's cart
    # @cart.items << @item
    # @cart.save

    # Get user's cart's items
    @items = @cart.items

    # Calculate total cart price
    @cart_price = helpers.calculate_total_cart_price(@items)
  end

  def destroy
    @cart = Cart.destroy(params[:id])
  end

  def remove_item
    # Find the item to remove
    @item = Item.find(params[:id])

    # Remove the item from Carts TODO: Complete code below
    # @cart = Cart.find(current_user)
    # @cart.items.delete(@item)

    redirect_to cart_path
  end

  private

end
