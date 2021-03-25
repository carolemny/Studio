class CheckoutController < ApplicationController
  before_action :space_is_available?, only: [:create]
 
  def create
    date_start = Date.parse(params[:start_date])
    date_end = Date.parse(params[:end_date])
    duration = (date_end - date_start).to_i + 1
    @total = params[:sub_total].to_i * duration.to_i

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
    session[:end_date] = params[:end_date]

    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    @space = Space.find(session[:space_id])
    @booking = Booking.create(start_date: session[:start_date], end_date: session[:end_date], guest_id: current_user.id, space_id: session[:space_id])
    @conversation = Conversation.between(@space.host_id, @booking.guest_id).first
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


end
