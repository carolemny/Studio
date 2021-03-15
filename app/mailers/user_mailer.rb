class UserMailer < ApplicationMailer
    default from: 'team.studio.thp@gmail.com'
 
    def welcome_email(user)

      @user = user 
  
      @url  = 'https://studiofinalproject.herokuapp.com/' 
  
      mail(to: @user.email, subject: 'Bienvenue chez STUDIO') 
    end
end
