class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    # Search-related variables
    @airports_options = Airport.distinct.order(:code).map { |a| [a.code, a.id] }
    @date_options = Flight.distinct.pluck(:start_datetime).map(&:to_date).sort
    @num_tickets_options = (1..4)
    @search_params = params
    @flights = search_params_present? ? Flight.search(params).order(:start_datetime) : Flight.order(start_datetime: :asc).limit(5)

    # Dashboard-specific data
    @bookings = Booking.order(created_at: :desc).limit(5)
    @recent_passengers = Passenger.joins(:booking).order('bookings.created_at DESC').limit(5)
  end

  private

  def search_params_present?
    params[:departure_code].present? &&
      params[:arrival_code].present? &&
      params[:num_tickets].present?
  end
end
