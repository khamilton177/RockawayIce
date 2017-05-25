Rails.application.routes.draw do

  get 'flavors/about'

  get 'flavors/flavor_friday_form'
  post '/flavors', to: 'flavors#vote'

  get 'flavors/flavor_faves'

  get 'home/index'
  root to: 'home#index'

  get 'maps/wheres_cart'

  get 'events/event_form'
  post '/events', to: 'events#request_event'

  # post '/flavors', to: 'flavors#vote'

  get '/contacts/:id/unsubscribe_form', to: 'contacts#unsubscribe_form', as: :unsubscribe_form_contact
  patch '/contacts/:id/unsubscribe', to: 'contacts#unsubscribe', as: :unsubscribe_contact
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
