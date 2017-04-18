Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'google_data/index'

  get 'google_data/show'

  get 'google_data/new'

  get 'google_data/destroy'

  get 'google_data/edit'

  get 'homes/events'
  post '/events' => "homes#events"

  get 'homes/disconnect_account'
  post '/disconnect_account' => "homes#disconnect_account"

  resources :homes
  root to: "homes#new"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
end
