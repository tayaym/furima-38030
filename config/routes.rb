Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create] do
    resources :items, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
