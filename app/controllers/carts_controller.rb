class CartsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :create_session_cart

  def create
    @cart = Cart.create(user: current_user())

    # Add new cart to user #TODO : Complete code below
    current_user.cart = @cart
    current_user.save
  end

  def show
    # Get user's cart's items to pass it to the view
    @items = current_user.cart.items

    # Calculate total cart price to pass it to the view
    @cart_price = helpers.calculate_total_cart_price(@items)

    # Count total number of items to pass is to the view
    @items_count = @items.count
  end

  def destroy
    @cart = Cart.destroy(params[:id])
  end
end
