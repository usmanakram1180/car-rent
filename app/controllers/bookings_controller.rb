class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      respond_to do |format|
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_params
    params.permit(:car_type, :pick_up_location, :drop_off_location, :pick_up_date, :pick_up_time, :drop_off_date, :drop_off_time)
  end
end
