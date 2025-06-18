Rails.application.routes.draw do
 devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks'
}
  


  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # your routes here...
  resources :flights, only: [ :index ]
resources :bookings, only: [:index, :new, :create, :show]
  root "flights#index"
end



 namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :flights
    resources :bookings
    resources :airports, only: [:index, :edit, :update]
  end
  
end
