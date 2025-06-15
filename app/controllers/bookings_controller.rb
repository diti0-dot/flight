class BookingsController < ApplicationController
   include Internationalization
  def new
    @booking = Booking.new
    @flight = flight_find
    @num_tickets = ticket_params
    @num_tickets.times { @booking.passengers.build }
  end

  def create
     @booking = Booking.new(booking_params)
    @flight = flight_find
    @num_tickets = ticket_params

    if @booking.save
      flash[:notice] = "Flight booked!"
      redirect_to @booking
    else
      flash.now[:alert] = "Could not book flight!"
      render :new, status: :unprocessable_entity
    end
  end

   def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end



  private

  def booking_params
    params.require(:booking).permit(:flight_id,:num_tickets,passengers_attributes: [ :name, :email ])
  end

  def flight_find 
    Flight.find(params[:booking][:flight_id])
  end

  def ticket_params
     params[:booking][:num_tickets].to_i
  end
end
