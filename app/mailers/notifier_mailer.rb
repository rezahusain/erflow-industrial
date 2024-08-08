class NotifierMailer < ApplicationMailer
  default from: 'rezahusain99@gmail.com'
  def position_notifier
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
