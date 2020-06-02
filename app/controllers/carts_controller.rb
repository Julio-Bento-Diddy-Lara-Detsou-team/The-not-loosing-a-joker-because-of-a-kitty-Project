class CartsController < ApplicationController

  def create
    @cart = Cart.create(user: current_user())
  end

  def show
    # # Get current user
    # @user = current_user
    #
    # # Get users items
    # puts @item= Item.find(params[:id])
    #
    # # Add item to user's
    # @cart = Cart.create!(user_id: @user)
    #
    # # Add item to User's cart
    # @cart.items << @item
    # @cart.save

    # Test d'affichage de données examples
    @items = Item.all

    # Calculate cart price TODO: Place this small function into a helper
    def calculate_total_cart_price(items)
      @cart_price = 0
      items.each do |item|
        @cart_price += item.price
      end

      @cart_price
    end

    @cart_price = calculate_total_cart_price(@items)
  end

  def update

  end

  def destroy
    @cart = Cart.destroy(params[:id])
  end

end
