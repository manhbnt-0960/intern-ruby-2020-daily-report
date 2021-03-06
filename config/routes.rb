Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "account#index"

    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    put "/manager/reports", to: "manager/reports#update"

    namespace :manager do
      get "/users/search", to: "users#search"
      resources :reports, only: %i(index show update)
      resources :users, only: %i(index show update)
    end

    resources :reports
    resources :account, only: %i(index edit update)
    resources :comments, only: :create
  end
end
