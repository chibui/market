Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :items
  resources :roles
  resources :charges


  get 'store/index'
  get 'legal/tos'

  # routes for shipped status toggling
  resources :orders do
    member do
      put :shipped
    end
  end

  # routes for received status toggling
  resources :orders do
    member do
      put :received
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  scope "/admin" do
    resources :users
  end

  resources :conversations do
    resources :messages
  end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
      root :to => 'store#index', as: :authenticated_root
  end

  # root :to => 'welcome#index'
  root :to => 'welcome#index'

end
