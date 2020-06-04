class OrderMailer < ApplicationMailer
  default from: 'moufaca755@gmail.com'

  def order_email(user)
    @user = user
    @cart = @user.cart
    @url = 'https://thp-keety-sweety.herokuapp.com/'
    mail(to: @user.email, subject: 'Votre commande Kitty Sweety !')

    @cart_price = 0
    @cart.items.each do |item|
      @cart_price += item.price
    end
  end

end
