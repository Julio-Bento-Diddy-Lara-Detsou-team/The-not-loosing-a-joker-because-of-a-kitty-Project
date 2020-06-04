class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :create_session_cart

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

    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to new_charge_path

    # Redirect and display success message
    flash[:success] = "Miaaaaouh ! Votre commande à été acceptée et vous sera prochainement envoyée par email."
    redirect_to root_path
  end

end
