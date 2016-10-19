Rails.application.routes.draw do

root to: 'products#index'

  resources :products do
    resources :reviews
  end

    resources :categories
    resources :guests
    resources :merchants
    resources :orders


  get 'sessions/create'

  get 'sessions/destroy'


  get "/auth/:provider/callback" =>  "sessions#create"

end
