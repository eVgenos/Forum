Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'

  root 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
  end

end
