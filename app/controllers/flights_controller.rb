class FlightsController < ApplicationController
  include Internationalization

  def index
    @airports_options = Airport.distinct.order(:code).map { |a| [ a.code, a.id ] }
    @date_options = Flight.distinct.pluck(:start_datetime).map(&:to_date).sort
    @num_tickets_options = (1..4)
    @flights = search_params_present? ? Flight.search(params).order(:start_datetime) : []
    
    @search_params = params
  end

  private 
  def search_params_present? 
    params[:departure_code].present? &&
      params[:arrival_code].present? &&
      params[:num_tickets].present?
  end
end