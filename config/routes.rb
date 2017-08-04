Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'admin/sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'admin/sessions#destroy', as: 'signout'

  namespace :admin do
    # get 'admins/index'
    # get 'admins/show'
    # get 'admins/new'
    # get 'admins/edit'
    # get 'admins/update'
    # get 'admins/destroy'
    resources :admins
    # resources :locations
    # resources :flavors
  end

  namespace :admin do
    get 'sessions/create'
    get 'sessions/destroy'
    get 'portal', to: 'admins#index'

  end

  get 'flavors/about'
  get 'flavors/flavor_friday_form'
  post '/flavors', to: 'flavors#vote'
  get 'flavors/flavor_faves'
  get '/flavors/:id/edit', to: 'flavors#edit', as: :edit_flavor

  get 'home/index'
  root to: 'home#index'
  get 'home/download_card'
  get 'home/commercial'

  get 'maps/wheres_cart'

  get 'events/event_form'
  post '/events', to: 'events#request_event'

  get '/contacts/:id/unsubscribe_form', to: 'contacts#unsubscribe_form', as: :unsubscribe_form_contact
  patch '/contacts/:id/unsubscribe', to: 'contacts#unsubscribe', as: :unsubscribe_contact
  resources :contacts

  get '*unmatched_route', to: 'application#raise_not_found'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
