Rails.application.routes.draw do
  root "users#show"
  resources :users

  get "/users/email-preferences", to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
