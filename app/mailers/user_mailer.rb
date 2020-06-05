class UserMailer < ApplicationMailer
  default from: 'julien.tribouillier@orange.fr'
  # default from: 'moufaca755@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://thp-keety-sweety.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez Kitty Sweety !')
  end

end
