Rails.application.routes.draw do
  root 'books#index'

  # Аутентификация
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Ресурсы
  resources :genres, only: [:index, :new, :create, :destroy]
  resources :books do
    resources :readings, only: [:new, :create, :edit, :update, :destroy]  # НЕТ :show!
  end
end