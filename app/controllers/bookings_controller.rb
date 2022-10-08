class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm]

  def index
    @bookings = Booking.all
  end
  def edit

  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def confirm
    @booking.status = 1
    @booking.save
    redirect_to bookings_path, notice: "Booking confirmed!"
  end

  def new
    @booking = Booking.new
  end

  def create
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = current_user
    @booking.status = 0
    if @booking.save
      redirect_to costume_path(@costume), notice: "Booked costume! Waiting for confirmation."
    else
      render "costumes/show"
    end
  end

  # def destroy
  #   @booking.destroy
  #   redirect_to bookings_path
  # end
  private

  def set_booking
   @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
