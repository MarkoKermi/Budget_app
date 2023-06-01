Rails.application.routes.draw do
  devise_for :users

    # resources :groups do
    #   resources :payments, only: %i[index show new create]

    # end  
  # get '/welcome', to: 'welcome#index'
  
  resources :users, only: [:index] do
    resources :groups, only: %i[index new create show] do
      resources :payments, only: %i[new create]
    end
  end
  # root 'groups#index'
  root 'users#index'
end
