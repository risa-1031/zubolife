Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  root "users#new"
  resources :users, only: [:index, :new, :create, :destroy]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :contents do
      resources :comments, only: :create
      collection do
        get 'search'
      end
    end
  end
end
