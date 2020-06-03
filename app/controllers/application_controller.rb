class ApplicationController < ActionController::Base

  # Return user's cart if already exists, else create it
  def get_cart
    if session['cart']
      # If session already exist
      @cart = session['cart']
    else
      # Create new session cart
      @cart = Cart.create(user: current_user)
      session['cart'] = @cart
    end

    # if user_signed_in?
    #   @cart = current_user.cart
    # else
    #   # Create new cart
    #   @cart = Cart.create(user: current_user)
    # end

    @cart
  end

  # def get_shopping_session(item)
  #   if current_user.cart.shopping_session
  #     # Get shopping session
  #     @cart = current_user.cart.shopping_session
  #   else
  #     # Create a new shopping session
  #     ShoppingSession.create!(cart: @cart, item: item)
  #   end
  #
  #   @shopping_session
  # end

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'Vous devez être connecté pour accéder à cette page.'

      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
