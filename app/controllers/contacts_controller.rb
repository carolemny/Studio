class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
      @contact = Contact.new message_params
  if @contact.valid?
        ContactMailer.contact(@contact).deliver_now
        redirect_to root_path
        flash[:notice] = "Demande de contact envoyée. Nous vous répondrons dans les plus brefs délais."
      else
        flash[:error] = "Erreur. Votre demande n'a pas pu être envoyée."
        render :new
      end
    end
    
  private
  def message_params
      params.require(:contact).permit(:name, :email, :body)
    end
  end