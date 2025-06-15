# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create all airports
["JFK", "LAX", "ORD", "ATL", "YYZ",
 "MEX", "MIA", "SFO", "YVR", "DFW",
 "LHR", "CDG", "FRA", "AMS", "IST",
 "MAD", "FCO", "BCN", "DUB", "ARN",
 "HND", "PEK", "DXB", "SIN", "BKK",
 "ICN", "DEL", "HKG", "KUL", "DOH",
 "SYD", "AKL", "MEL", "BNE", "JNB",
 "CAI", "NBO"].each do |code|
  Airport.find_or_create_by!(code: code)
end

# Create flight routes
[
  # JFK routes (New York)
  [Airport.find_by(code: "JFK").id, Airport.find_by(code: "JFK").id, "2028-03-14 10:30:00", "100"],
  [Airport.find_by(code: "JFK").id, Airport.find_by(code: "LAX").id, "2028-05-14 10:30:00", "350"],
  [Airport.find_by(code: "JFK").id, Airport.find_by(code: "ORD").id, "2028-05-15 12:45:00", "180"],
  [Airport.find_by(code: "JFK").id, Airport.find_by(code: "LHR").id, "2028-05-16 18:20:00", "420"],
  [Airport.find_by(code: "JFK").id, Airport.find_by(code: "HND").id, "2028-05-17 14:30:00", "780"],
  
  # LAX routes (Los Angeles)
  [Airport.find_by(code: "LAX").id, Airport.find_by(code: "SFO").id, "2028-05-18 07:15:00", "90"],
  [Airport.find_by(code: "LAX").id, Airport.find_by(code: "JFK").id, "2028-05-19 10:30:00", "350"],
  [Airport.find_by(code: "LAX").id, Airport.find_by(code: "SYD").id, "2028-05-20 22:30:00", "960"],
  
  # LHR routes (London Heathrow)
  [Airport.find_by(code: "LHR").id, Airport.find_by(code: "JFK").id, "2028-05-21 09:15:00", "420"],
  [Airport.find_by(code: "LHR").id, Airport.find_by(code: "DXB").id, "2028-05-22 14:50:00", "360"],
  [Airport.find_by(code: "LHR").id, Airport.find_by(code: "FRA").id, "2028-05-23 08:30:00", "80"],
  
  # HND routes (Tokyo Haneda)
  [Airport.find_by(code: "HND").id, Airport.find_by(code: "JFK").id, "2028-05-24 16:20:00", "780"],
  [Airport.find_by(code: "HND").id, Airport.find_by(code: "ICN").id, "2028-05-25 11:20:00", "120"],
  [Airport.find_by(code: "HND").id, Airport.find_by(code: "PEK").id, "2028-05-26 13:40:00", "180"],
  
  # DXB routes (Dubai)
  [Airport.find_by(code: "DXB").id, Airport.find_by(code: "LHR").id, "2028-05-27 13:20:00", "360"],
  [Airport.find_by(code: "DXB").id, Airport.find_by(code: "DEL").id, "2028-05-28 03:15:00", "150"],
  [Airport.find_by(code: "DXB").id, Airport.find_by(code: "JNB").id, "2028-05-29 08:45:00", "480"],
  
  # SYD routes (Sydney)
  [Airport.find_by(code: "SYD").id, Airport.find_by(code: "LAX").id, "2028-05-30 11:30:00", "960"],
  [Airport.find_by(code: "SYD").id, Airport.find_by(code: "AKL").id, "2028-05-31 09:10:00", "120"],
  [Airport.find_by(code: "SYD").id, Airport.find_by(code: "HKG").id, "2028-06-01 15:45:00", "540"],
  
  # Additional major routes
  [Airport.find_by(code: "FRA").id, Airport.find_by(code: "JFK").id, "2028-06-02 16:20:00", "450"],
  [Airport.find_by(code: "SFO").id, Airport.find_by(code: "LAX").id, "2028-06-03 19:30:00", "80"],
  [Airport.find_by(code: "PEK").id, Airport.find_by(code: "HND").id, "2028-06-04 10:15:00", "180"],
  
  # Self-referential flights for remaining airports
  [Airport.find_by(code: "ORD").id, Airport.find_by(code: "ORD").id, "2028-06-05 10:30:00", "100"],
  [Airport.find_by(code: "ATL").id, Airport.find_by(code: "ATL").id, "2028-06-06 10:30:00", "100"],
  [Airport.find_by(code: "YYZ").id, Airport.find_by(code: "YYZ").id, "2028-06-07 10:30:00", "100"],
  [Airport.find_by(code: "MEX").id, Airport.find_by(code: "MEX").id, "2028-06-08 10:30:00", "100"],
  [Airport.find_by(code: "MIA").id, Airport.find_by(code: "MIA").id, "2028-06-09 10:30:00", "100"],
  [Airport.find_by(code: "YVR").id, Airport.find_by(code: "YVR").id, "2028-06-10 10:30:00", "100"],
  [Airport.find_by(code: "DFW").id, Airport.find_by(code: "DFW").id, "2028-06-11 10:30:00", "100"],
  [Airport.find_by(code: "CDG").id, Airport.find_by(code: "CDG").id, "2028-06-12 10:30:00", "100"],
  [Airport.find_by(code: "AMS").id, Airport.find_by(code: "AMS").id, "2028-06-13 10:30:00", "100"],
  [Airport.find_by(code: "IST").id, Airport.find_by(code: "IST").id, "2028-06-14 10:30:00", "100"],
  [Airport.find_by(code: "MAD").id, Airport.find_by(code: "MAD").id, "2028-06-15 10:30:00", "100"],
  [Airport.find_by(code: "FCO").id, Airport.find_by(code: "FCO").id, "2028-06-16 10:30:00", "100"],
  [Airport.find_by(code: "BCN").id, Airport.find_by(code: "BCN").id, "2028-06-17 10:30:00", "100"],
  [Airport.find_by(code: "DUB").id, Airport.find_by(code: "DUB").id, "2028-06-18 10:30:00", "100"],
  [Airport.find_by(code: "ARN").id, Airport.find_by(code: "ARN").id, "2028-06-19 10:30:00", "100"],
  [Airport.find_by(code: "SIN").id, Airport.find_by(code: "SIN").id, "2028-06-20 10:30:00", "100"],
  [Airport.find_by(code: "BKK").id, Airport.find_by(code: "BKK").id, "2028-06-21 10:30:00", "100"],
  [Airport.find_by(code: "ICN").id, Airport.find_by(code: "ICN").id, "2028-06-22 10:30:00", "100"],
  [Airport.find_by(code: "DEL").id, Airport.find_by(code: "DEL").id, "2028-06-23 10:30:00", "100"],
  [Airport.find_by(code: "HKG").id, Airport.find_by(code: "HKG").id, "2028-06-24 10:30:00", "100"],
  [Airport.find_by(code: "KUL").id, Airport.find_by(code: "KUL").id, "2028-06-25 10:30:00", "100"],
  [Airport.find_by(code: "DOH").id, Airport.find_by(code: "DOH").id, "2028-06-26 10:30:00", "100"],
  [Airport.find_by(code: "AKL").id, Airport.find_by(code: "AKL").id, "2028-06-27 10:30:00", "100"],
  [Airport.find_by(code: "MEL").id, Airport.find_by(code: "MEL").id, "2028-06-28 10:30:00", "100"],
  [Airport.find_by(code: "BNE").id, Airport.find_by(code: "BNE").id, "2028-06-29 10:30:00", "100"],
  [Airport.find_by(code: "JNB").id, Airport.find_by(code: "JNB").id, "2028-06-30 10:30:00", "100"],
  [Airport.find_by(code: "CAI").id, Airport.find_by(code: "CAI").id, "2028-07-01 10:30:00", "100"],
  [Airport.find_by(code: "NBO").id, Airport.find_by(code: "NBO").id, "2028-07-02 10:30:00", "100"]
].each do |dep, arr, start, length|
  Flight.find_or_create_by!(
    departure_airport_id: dep,
    arrival_airport_id: arr,
    start_datetime: start,
    duration: length
  )
end