Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", as: :signed_in_root
  end

  root to: "homes#show"

  resource :search, only: [:show]

  post "text_shouts" => "shouts#create", defaults: { content_type: TextShout }
  post "photo_shouts" => "shouts#create", defaults: { content_type: PhotoShout }

  resources :shouts, only: [:show] do 
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :hashtags, only: [:show]

  resources :users, only: [:create, :show] do
    resources :followers, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
