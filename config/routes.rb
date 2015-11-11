Rails.application.routes.draw do
  get "pages/landing"
  root 'pages#dispatcher'


  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  namespace :citizen do
    root to: "events#index"

    resources :events, only: [:index] do
      member do
        get :thanks
      end
      resources :surveys, only: [:new, :create]
    end
  end

  namespace :student do
    root to: "courses#index"

    resources :courses, only: [:index] do
      member do
        post :join
      end
      resources :inquiries, only: [:index]
    end
  end

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
    resources :events

    resources :courses
    
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
end