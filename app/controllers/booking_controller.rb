class BookingController < ApplicationController
  def create
    Booking::Create.run(booking_params)
    render status: :ok
  end

  private

  def booking_params
    params.permit(:driver_id, :from, :to, :at)
  end
end
