Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'
  get 'legal/tos'

  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :items

  resources :roles

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
      root :to => 'store#index', as: :authenticated_root

  end

  # root :to => 'welcome#index'
  root :to => 'welcome#index'
end
