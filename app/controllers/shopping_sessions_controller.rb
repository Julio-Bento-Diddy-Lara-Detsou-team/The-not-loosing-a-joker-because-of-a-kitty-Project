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

    redirect_back(fallback_location: root_path)
  end

  def destroy
    # Find the item to remove
    @item = Item.find(params[:id])

    # Remove the item from Cart's item' list if it is present
    if current_user.cart.items.include?(@item)
      current_user.cart.items.delete(@item)
    end

    flash[:error] = "Le produit a bien été retiré du panier"

    redirect_back(fallback_location: root_path)
  end

end
