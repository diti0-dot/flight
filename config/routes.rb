Rails.application.routes.draw do


  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # your routes here...
  resources :flights, only: [ :index ]
  resources :bookings, only: [ :new, :create, :show ]
  root "flights#index"
end
end
