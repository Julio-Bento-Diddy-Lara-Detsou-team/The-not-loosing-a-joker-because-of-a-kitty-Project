class CartsController < ApplicationController

  def create
    @cart = Cart.create(user: current_user())

    # Add new cart to user #TODO : Complete code below
    # current_user.cart = @cart
    # current_user.save
  end

  def show
    # Get current user
    @user = current_user

    # Get users items
    puts @item= Item.find(params[:id])

    # Create a new cart
    # @cart = Cart.create!(user_id: @user)

    # Add item to User's cart
    # @cart.items << @item
    # @cart.save

    # Test d'affichage de données examples
    @items = Item.all

    # Calculate total cart price
    @cart_price = helpers.calculate_total_cart_price(@items)
  end

  def update

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

end
