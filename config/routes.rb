Rails.application.routes.draw do
  get 'flights/index'
  root 'flights#index'

  resources :bookings, only: [:new, :create, :show]
end
