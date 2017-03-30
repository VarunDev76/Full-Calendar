Rails.application.routes.draw do
  # get 'homes/index'

  # get 'homes/new'

  # get 'homes/show'

  # get 'homes/edit'

  get 'homes/events'
  post '/events' => "homes#events"

  resources :homes
  root to: "homes#new"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
