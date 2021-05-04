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
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit]
    get "/order/:id" => "customers#order" ,as: 'order'
    # 注文内容詳細
    patch "/orders/:id/edit" => "orders#update", as:"order_edit"
    patch "/order_detail/:id" => "orders#making_status_update", as:"order_detail_edit"
    get "/customers/:id/orders" => "customers#orders" ,as:"customer_orders"
    patch "/customers/:id" => "customers#update",as:"admin_customer"
  end

  # namespace :public do
    # get "/" => "homes#top"
    # get "/about" => "homes#about"
    # アバウトページ表示できない…
    # resources :customers, only: [:show, :edit, :update,]
    # get "/unsubscribe" => "customers#unsubscribe"
    # patch "/customers" => "customers#withdraw"
    # resources :items, only: [:index, :show]
  # end

  get "/admin/customers/:id/orders" => "admin/customers#order"

  root to: "public/homes#top"

  get "/about" => "public/homes#about"
  get "/customers" => "public/customers#show"
  # get "/customers/edit" => "public/customers#edit"
  # deviseで作成したルーティングと被っている…deviseで作成したルーティングを削除したい
  patch "/customers" => "public/customers#update"
  get "/customers/delete" => "public/customers#unsubscribe"
  # 退会臥煙の表示
  patch "/customers/withdraw" => "public/customers#withdraw"
  # 退会処理実行


  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show"

  get "/cart_items" => "public/cart_items#index"
  patch "/cart_item/:id" => "public/cart_items#update"
  delete "/cart_item/:id" => "public/cart_items#destroy"
  delete "/cart_items" => "public/cart_items#reset"
  post "/cart_items" => "public/cart_items#create"

  get "/orders/new" => "public/orders#new"
  post "/orders/confirm" => "public/orders#confirm"
  get "orders/thanks" => "public/orders#thanks"
  post "/orders" => "public/orders#create"
  get "/orders" => "public/orders#index"
  get "/orders/:id" => "public/orders#show"

  get "/address" => "public/address#index"
  get "/address/:id/edit" => "public/address#edit"
  post "/address/new" => "public/address#create"
  patch "/address/:id" => "public/address#update"
  delete "/address/:id" => "public/address#destroy"


end
