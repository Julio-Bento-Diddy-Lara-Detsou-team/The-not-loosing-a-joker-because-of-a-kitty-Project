class ApplicationController < ActionController::Base

  # If session cart does not already exist then create it
  def create_session_cart
    if user_signed_in? && !session['cart']
      session['cart'] = Cart.create(user_id: current_user.id)
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'Vous devez être connecté pour accéder à cette page.'
      redirect_to new_user_session_path
    end
  end
end
