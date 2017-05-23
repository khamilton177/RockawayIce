Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  get 'maps/wheres_cart'

  get 'events/event_form'
  post '/events', to: 'events#request_event'

  get '/contacts/:id/unsubscribe_form', to: 'contacts#unsubscribe_form', as: :unsubscribe_form_contact
  patch '/contacts/:id/unsubscribe', to: 'contacts#unsubscribe', as: :unsubscribe_contact
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
