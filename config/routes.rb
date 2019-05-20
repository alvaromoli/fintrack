Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  get 'portfolio', to: "users#portfolio"
  get 'stocks/search', to: "stocks#search"
  resources :user_stocks, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
