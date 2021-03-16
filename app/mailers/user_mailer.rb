class UserMailer < ApplicationMailer
    default from: 'team.studio.thp@gmail.com'
 
    def welcome_email(user)

      @user = user 
  
      @url = 'https://studiofinalproject.herokuapp.com/users/sign_in'
  
      mail(to: @user.email, subject: 'Bienvenue chez STUDIO') 
    end

    def booking_email(user)

      @user = User.find(user)
      @

      @url = 'https://studiofinalproject.herokuapp.com'

      mail(to: @user.email, subject: 'Confirmation de votre réservation chez STUDIO') 
    end

end
