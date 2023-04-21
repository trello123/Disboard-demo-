Rails.application.routes.draw do
  devise_for :users
  resources :cards
  resources :boards
  resources :containers
  
  #註冊及忘記密碼頁面重新整理會出錯 修正路徑
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  #homepage
  root 'homepages#index'
  # api(url) = /api/v1/cards/:id/sort
  namespace :api do
    namespace :v1 do
      resources :cards, only: [] do
        member do
          patch :sort
        end
      end
    end
  end
end
