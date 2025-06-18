# app/controllers/admin/bookings_controller.rb
class Admin::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @bookings = Booking.includes(:flight, :user).order(created_at: :desc)
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  def edit
       @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end
  
  def update
   @booking = Booking.find(params[:id])
    @flight = @booking.flight
    if @booking.update(booking_params)
      redirect_to admin_booking_path(@booking), notice: 'Booking was successfully updated.'
    else
        Rails.logger.debug("Booking update errors: #{@booking.errors.full_messages.join(', ')}")
    render :edit
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to admin_bookings_path, notice: 'Booking was successfully deleted.'
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(
      :num_tickets,
      passengers_attributes: [:id, :name, :email, :_destroy]
    )
  end
  
  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end