Rails.application.routes.draw do
  get 'tests/index'
  get 'tests/show'
  get 'tests/new'
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
