Rails.application.routes.draw do
  namespace :users do
    resources :surveys, only: [:new, :create]
  end
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  namespace :admin do
    resources :terms do
      resources :evaluations
    end
    resources :evaluations do
      resources :questions
    end
    resources :question_types
    resources :parties do
      resources :congressmen, shallow: true
    end
    resources :congressmen do
      resources :congressmen_evaluations, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :inquires
    end
    resources :party_groups
    
    resources :committees do
      resources :interpellations, shallow: true do
        resources :inquires
      end
    end
    
    root to: "base#dashboard"
  end

  devise_for :admin, controllers: {
        sessions: 'admin/sessions',
        registrations: 'admin/registrations'
      }

  namespace :api do
    namespace :v1 do
      get 'locations/districts_index'
    end
  end

  root 'pages#landing'
end