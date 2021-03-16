class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
      @contact = Contact.new message_params
  if @contact.valid?
        ContactMailer.contact(@contact).deliver_now
        redirect_to root_path
        flash[:notice] = "We have received your message and will be in touch soon!"
      else
        flash[:notice] = "There was an error sending your message. Please try again."
        render :new
      end
    end
    
  private
  def message_params
      params.require(:contact).permit(:name, :email, :body)
    end
  end