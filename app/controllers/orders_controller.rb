class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :create_session_cart

  # Show all user's passed orders and their orders
  def index
    @orders = current_user.orders
    @items = Item.all
  end

  def create
    # Get carts informations
    @cart = current_user.cart

    # Get total cart price
    @cart_price = helpers.calculate_total_cart_price(@cart.items)

    # Amount in cents
    @amount = @cart_price.to_i * 100

    customer = Stripe::Customer.create(
        {
            email: params[:stripeEmail],
            source: params[:stripeToken],
        })

    charge = Stripe::Charge.create(
        {
            customer: customer.id,
            amount: @amount,
            description: 'Rails Stripe customer',
            currency: 'EUR',
        })

    # Save cart's data as an order
    @order = Order.create!(stripe_customer_id: customer.id, user_id: current_user.id)

    # Save cart's items as order_items
    current_user.cart.items.each do |item|
      @order_items = OrderItem.create!(
          quantity: 1, # TODO : Replace this by item.quantity once the property will be added to the items table
          total_price: calculate_total_cart_price(current_user.cart.items),
          order_id: @order.id,
          item_id: item.id
      )
    end

    # Empty user's cart
    current_user.cart.items.destroy_all

    # Redirect and display success message
    flash[:success] = "Miaaaaouh ! Votre commande à été acceptée et vous sera prochainement envoyée par email."
    redirect_to root_path
  end

end
