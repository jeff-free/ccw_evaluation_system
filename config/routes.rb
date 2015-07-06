Rails.application.routes.draw do
  devise_for :admin, controllers: {
        sessions: 'admin/sessions',
        registrations: 'admin/registrations'
      }
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  namespace :admin do
    get "/dashboard", to: "base#dashboard"
  end

  namespace :api do
    namespace :v1 do
      get 'locations/districts_index'
    end
  end

  root 'pages#landing'
end