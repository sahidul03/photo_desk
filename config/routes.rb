Rails.application.routes.draw do
  get "/health", to: proc { [200, {}, ["Application is running."]] }

  namespace :v1, defaults: {format: :json} do
    resources :posts
    post 'auth/sign_in', to: 'auth#sign_in'
    post 'auth/sign_out', to: 'auth#sign_out'
  end
end
