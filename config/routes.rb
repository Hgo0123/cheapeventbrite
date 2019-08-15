Rails.application.routes.draw do


devise_for :users

  resources :users

  root 'events#index'
  post 'events/subscribe/:id', to: 'events#subscribe', as: 'event_subscribe'

resources :attendances, only: [:index,:show,:new, :create]

resources :events

resources :charges

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
