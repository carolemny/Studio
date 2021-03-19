module CreateBooking
  private

  def create_booking
    @booking = Booking.create(start_date: session[:start_date], duration: session[:duration], guest_id: session[:guest_id], space_id: session[:space_id])
    UserMailer.booking_email(session[:guest_id]).deliver_now
  end
end
