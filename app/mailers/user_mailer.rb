class UserMailer < ApplicationMailer
    default from: 'team.studio.thp@gmail.com'
 
    def welcome_email(user)

      @user = user
  
      mail(to: @user.email, subject: 'Bienvenue chez STUDIO') 
    end

    def booking_email(user_id, booking)

      @user = User.find(user_id)
      @booking = booking
      puts "X" * 100
      puts user_id
      puts booking
      puts "X" * 100

      mail(to: @user.email, subject: 'Confirmation de votre réservation chez STUDIO') 
    end

end
