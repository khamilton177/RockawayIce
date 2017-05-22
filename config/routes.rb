Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'
  
  get 'events/event_form'
  post '/events', to: 'events#request_event'

  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
