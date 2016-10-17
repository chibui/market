Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :items
  resources :roles

  get 'store/index'
  get 'legal/tos'

  resources :orders do
    member do
      put :shipped
    end
  end

  devise_for :users
  scope "/admin" do
    resources :users
  end


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
      root :to => 'store#index', as: :authenticated_root
  end

  # root :to => 'welcome#index'
  root :to => 'welcome#index'

end
