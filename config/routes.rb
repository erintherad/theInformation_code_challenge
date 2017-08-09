Rails.application.routes.draw do
  root "admin#index"

  get "/email-preferences", to: "users#show"
  put "/email-preferences", to: "users#update"

  get "/admin", to: "admin#index"
  get "/admin/new", to: "admin#new", as: "admin_new"
  post "/admin/new", to: "admin#create"
  get "/generate_token/:id", to: "admin#generate_token", as: "generate_token"
  delete "/admin/:id", to: "admin#delete", as: "delete_user"
end

# Prefix Verb   URI Pattern                  Controller#Action
#              root GET    /                            admin#index
# email_preferences GET    /email-preferences(.:format) users#show
#                   PUT    /email-preferences(.:format) users#update
#             admin GET    /admin(.:format)             admin#index
#    generate_token GET    /admin(.:format)             admin#generate_token
#         admin_new GET    /admin/new(.:format)         admin#new
#       delete_user DELETE /admin/:id(.:format)         admin#delete
