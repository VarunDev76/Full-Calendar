Rails.application.routes.draw do
  get 'homes/events'
  post '/events' => "homes#events"

  get 'homes/disconnect_account'
  post '/disconnect_account' => "homes#disconnect_account"

  resources :homes
  root to: "homes#new"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
end
