class AdminMailer < ApplicationMailer
  # default from: 'moufaca755@gmail.com'
  default from: 'detsouvan@hotmail.com'

  def order_email(order)
    @order = order
    @user = @order.user
    @cart = @user.cart
    @url = 'https://thp-keety-sweety.herokuapp.com/'
    @cart_price = cart_price(order)
    @admin = User.find_by(is_admin: true)
    mail(to: @admin.email, subject: 'Une commande a été passé sur Kitty Sweety !')
  end

end
