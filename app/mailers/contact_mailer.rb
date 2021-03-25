class ContactMailer < ApplicationMailer
    default from: 'team.studio.thp@gmail.com'
 
    def contact(mail)

      @contact = mail
  
      mail(to: 'team.studio.thp@gmail.com', subject: 'Demande de contact') 
    end

end
