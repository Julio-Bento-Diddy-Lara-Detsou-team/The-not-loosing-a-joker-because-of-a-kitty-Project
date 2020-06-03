class ShoppingSessionsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!

  def new
    # Get user's item
    @item = Item.find(params[:id])

    # Add the item to user's cart
    unless current_user.cart.items.include?(@item)
      current_user.cart.items << @item
      current_user.save
    end

    flash[:success] = "Le produit a bien été ajouté au panier"
    redirect_to items_path
  end

  def destroy
    # Find the item to remove
    @item = Item.find(params[:id])

    # Remove the item from Cart's item' list if it is present
    if current_user.cart.items.include?(@item)
      current_user.cart.items.delete(@item)
    end

    redirect_to cart_path(current_user.cart.id)
  end

end
