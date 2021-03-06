Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }, 
    path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    post :start, on: :member
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resource :feedback, only: %i[new create]
  resources :badges, only: %i[index]

  namespace :admin do
    resources :badges, shallow: true
    resources :gists, shallow: true, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
