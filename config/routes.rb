Rails.application.routes.draw do
  root "users#index"
  resources :users

  get "/email-preferences", to: "users#show"
  put "/email-preferences", to: "users#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
