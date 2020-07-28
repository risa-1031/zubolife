Rails.application.routes.draw do
  devise_for :users
  
  root "contents#index"
  resources :users, only: [:index, :show]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :contents do
      resources :comments, only: :create
      collection do
        get 'search'
      end
    end
  end
end
