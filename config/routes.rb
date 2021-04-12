Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registras: 'admins/registras',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registras: 'customers/registras',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get "/" => "homes#index"
    # ここtopアクションにしたいらしい…
    resources :items, except: [:destroy]
    #get "admin/items/new" => "admin/items#new"
    # "admin/items" => "admin/items#create"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :public do
    get "/" => "homes#top"
    get "/about" => "homes#about"
    # アバウトページ表示できない…
    resources :customers, only: [:show, :edit, :update]
    get "/unsubscribe" => "customers#unsubscribe"
    patch "/customers" => "customers#withdraw"
    resources :items, only: [:index, :show]
  end

end
