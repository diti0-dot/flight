# app/controllers/admin/flights_controller.rb
class Admin::FlightsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @flights = Flight.all.order(start_datetime: :asc)
  end
  
  def new
    @flight = Flight.new
    @airports = Airport.all
  end


  
  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to admin_flights_path, notice: 'Flight was successfully created.'
    else
      @airports = Airport.all
      render :new
    end
  end
  
  def edit
    @flight = Flight.find(params[:id])
    @airports = Airport.all
  end
  
  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to admin_flights_path, notice: 'Flight was successfully updated.'
    else
      @airports = Airport.all
      render :edit
    end
  end
  
  def destroy
     @flight = Flight.find(params[:id])
  @flight.destroy
  redirect_to admin_flights_path, notice: "Flight deleted successfully"
  end
  
  private
  
  def flight_params
    params.require(:flight).permit(
      :departure_airport_id, 
      :arrival_airport_id, 
      :start_datetime, 
      :duration
    )
  end
  
  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end