class CheckoutController < ApplicationController
  include CreateBooking
  before_action :space_is_available?, only: [:create]
  after_action :create_booking, only: [:success]
  after_action :create_conversation, only: [:success]

  def create
    @sub_total = params[:sub_total].to_i
    date_start = Date.parse(params[:start_date])
    date_end = Date.parse(params[:end_date])
    @duration = (date_end - date_start).to_i + 1
    @total = @sub_total * @duration.to_i

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [
        {
          name: "The Studio Project Stripe Checkout",
          amount: (@total * 100).to_i,
          currency: "eur",
          quantity: 1,
        },
      ],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
    )

    session[:start_date] = params[:start_date]
    session[:space_id] = params[:space_id]
    session[:guest_id] = current_user.id
    session[:end_date] = params[:end_date]

    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @space = Space.find(session[:space_id])
    flash[:notice] = "La réservation a bien été créée, un mail vous a été envoyé."
  end

  def cancel
  end

  private

  def space_is_available?
    space_non_available = Booking.available_date(params[:start_date], params[:end_date], params[:space_id])
    if space_non_available.length > 0
      flash[:alert] = "L'espace est déjà loué à cette date."
      redirect_to space_path(params[:space_id])
    end
  end

  def create_conversation

    @space = Space.find(session[:space_id])

    @conversation = Conversation.new(contact1_id: @space.host_id, contact2_id: current_user.id)

    if Conversation.between(@space.host_id, current_user.id).present?
      @conversation = Conversation.between(@space.host_id, current_user.id).first
     else 
      @conversation.save
     end
     
    Message.create(conversation_id: @conversation.id, 
    user_id: @space.host_id, 
    body: "Merci pour ta réservation #{current_user.full_name} concernant \"#{@space.title}\" du #{session[:start_date]} au #{session[:end_date]} ! 
    N'hésite pas à me contacter pour toute question éventuelle."
    )

  end 
end
