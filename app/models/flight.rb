class Flight < ApplicationRecord
   belongs_to :departure_airport, class_name: :Airport
  belongs_to :arrival_airport, class_name: :Airport
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings


    def self.search(params)
  flights = Flight.where(departure_airport_id: params[:departure_code],
                         arrival_airport_id: params[:arrival_code])

  if params[:date].present?
    date = Date.parse(params[:date])
    flights = flights.where(start_datetime: date.beginning_of_day..date.end_of_day)
  end

  flights
end


end

