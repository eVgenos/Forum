Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'
  get 'categories/admin' => 'categories#admin', as: :categories_admin
  get 'categories/admin/:id' => 'categories#publish', as: :publish_category
  get 'admin/banned/:id' => 'admin#banned', as: :banned_user

  root 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
  end

end
