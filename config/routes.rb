Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  devise_scope :user do
    # get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  root "users#new"
  resources :users, only: [:index, :new, :create, :destroy]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :contents do
      resources :comments, only: :create
      collection do
        get 'search'
      end
    end
    namespace :api do
      resources :contents, only: :index, defaults: { format: 'json' }
    end
  end
end
