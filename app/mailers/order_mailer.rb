class OrderMailer < ApplicationMailer
  default from: 'moufaca755@gmail.com'

  def order_email(order)
    @order = order
    @user = @order.user
    @cart = @user.cart
    @url = 'https://thp-keety-sweety.herokuapp.com/'
    @cart_price = cart_price(order)
    mail(to: @user.email, subject: 'Votre commande Kitty Sweety !')

  end

end
