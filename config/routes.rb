Rails.application.routes.draw do
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

    resources :inquiries, only: [] do
      member do
        post :mark_as_no_value
      end
    end
  end

  namespace :volunteer do
    root to: 'congressmen#index'
    resources :congressmen, only: [:index, :show]
    resources :inquiries, only: [:show] do
      resources :surveys, only: [:new, :create]
    end
  end

  namespace :student do
    root to: "courses#index"

    resources :users, only: [:edit, :update]

    resources :courses, only: [:index] do
      member do
        post :join
      end
      collection do
        get :thanks
      end
      resources :inquiries, only: [:index] do
        resources :surveys, only: [:new, :create]

        member do
          post :mark_as_no_value
        end
      end
    end
  end

  namespace :teachers do
    root to: "courses#index"

    resources :courses, only: [:index, :show]
  end

  namespace :admin do

    resources :reported_inquiries, only: [:index] do
      member do
        post :deactivate
      end
    end

    resources :signup_tokens, only: [:index, :new, :create] do
      member do
        post :toggle_active
      end
    end

    resources :terms do
      resources :evaluations, only: [:show, :edit, :new, :update, :create]
    end

    resources :evaluations, only: [] do
      resources :analytics, only: [:index, :show]
    end


    resources :question_types
    resources :parties do
      resources :congressmen, shallow: true
    end
    resources :congressmen do
      post "import_data", on: :collection
      resources :congressmen_evaluations, shallow: true, except: [:index] do
        post 'add_inquiry', on: :member
        delete '/remove_inquiry/:id', to: "congressmen_evaluations#remove_inquiry", as: "remove_inquiry"
      end
    end

    resources :committees do
      collection do
        post :import_data
      end
      resources :interpellations, shallow: true, except: [:index] do
        post 'add_inquiry', on: :member
        delete '/remove_inquiry/:id', to: "interpellations#remove_inquiry", as: "remove_inquiry"
      end
    end
    resources :events
    resources :courses

    resources :users

    post "upload_inquiries", to: "base#upload_inquiries"
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
