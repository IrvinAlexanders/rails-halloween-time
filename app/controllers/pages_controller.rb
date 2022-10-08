class PagesController < ApplicationController

  def home
  end

  def profile
    @user = current_user
    @bookings = Booking.all
  end
end
