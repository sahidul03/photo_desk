Rails.application.routes.draw do
  get "/health", to: proc { [200, {}, ["Application is running."]] }
  resources :posts
end
