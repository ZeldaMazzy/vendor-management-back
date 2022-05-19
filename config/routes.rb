# frozen_string_literal: true

Rails.application.routes.draw do
  resources :assignments
  resources :projects
  resources :vendors
  require 'sidekiq/web'

  root 'pages#home'
  get 'about', to: 'pages#about'

  scope :monitoring do
    # Sidekiq Basic Auth from routes on production environment
    if Rails.env.production?
      Sidekiq::Web.use Rack::Auth::Basic do |username, password|
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                    ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_username])) &
          ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                      ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_password]))
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        delete :logout
        get :me
        post :create
      end  
      namespace :projects do
        get :my_projects
      end
      resources :projects
      resources :vendors
    end
  end

end
