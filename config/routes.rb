Rails.application.routes.draw do



  resources :users
  root 'events#index'
  post 'events/subscribe/:id', to: 'events#subscribe', as: 'event_subscribe'

resources :attendances, only: [:index,:show,:new, :create]

resources :events

resources :charges

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
