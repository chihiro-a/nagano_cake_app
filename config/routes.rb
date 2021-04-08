Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registras: 'admins/registras',
    registrations: 'admins/registrations'
  }
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :orders, only:[:index]
  end
end
