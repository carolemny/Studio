class CheckoutController < ApplicationController
  before_action :start_date_is_possible?, only: [:create]

  def create
    puts "§"*200
    puts params
    @total = params[:total].to_i
    @start_date = params[:start_date]
    @space = 
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

    session[:start_date] = @start_date
    #session[:space_id] = @


    respond_to do |format|
      format.js
    end
  end

  def success
    puts "§"*200
    puts session[:start_date]
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  private

  def start_date_is_possible?
    if params[:start_date] < DateTime.now 
      flash[:error] = "Vous ne pouvez pas effectuer de réservation à cette date."
      redirect_to new_space_booking_path(params[:space_id])
      return false
    end
    booking = Booking.where(start_date: params[:start_date], space_id: params[:space_id])
    if booking.length > 0
      flash[:alert] = "L'espace est déjà loué à cette date."
      redirect_to new_space_booking_path(params[:space_id])
    end
  end
end
