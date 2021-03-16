class ContactMailer < ApplicationMailer
    default from: 'team.studio.thp@gmail.com'
 
    def contact(mail)

      @contact = mail 

      @url = 'https://studiofinalproject.herokuapp.com/users/sign_in'
  
      mail(to: 'team.studio.thp@gmail.com', subject: 'Demande de contact') 
    end

end
