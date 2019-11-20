# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  controller :people do
    post '/people/set_preferred/:id' => :set_preferred, as: :people_set_preferred
  end
  resources :people
  resources :automobiles
  resources :licenses
  controller :rents do
    get '/rents/calculate_cost' => :calculate_cost, as: :rents_calculate_cost
    post '/rents/pickup_car/:id' => :pickup_car, as: :rents_pickup_car
    post '/rents/return_car/:id' => :return_car, as: :rents_return_car
  end
  resources :rents

  root 'rents#index'
  get '*path' => redirect('/')
end
