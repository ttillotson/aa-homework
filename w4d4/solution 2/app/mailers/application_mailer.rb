class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url = 'www.realfakewebsite.com'
    mail(to: user.emal, from: 'everyboday@appacademy.io', subject:'Welcome to Real Fake Cat Rentals')
  end
end
