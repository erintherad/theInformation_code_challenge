Rails.application.routes.draw do
  root "admin#index"

  get "/email-preferences", to: "users#show"
  put "/email-preferences", to: "users#update"

  get "/admin", to: "admin#index"
  get "/admin/new", to: "admin#new"
  delete "/admin/:id", to: "admin#delete", as: "delete_user"
end
