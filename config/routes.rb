Rails.application.routes.draw do
  devise_for :users,controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                   registrations: 'users/registrations' }
  # resources :cards
  
  resources :boards do
    member do
      get :chart
    end
    resources :containers, shallow: true
    resources :calendars, only: [:index]
    resources :members
    resources :rooms
  end
  
  resources :containers, only: [] do
    resources :cards
  end

  resources :messages

  resources :cards do
    resources :comments
  end

  #註冊及忘記密碼頁面重新整理會出錯 修正路徑
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  resources :payments, only: [:index, :create] do 
    collection do
      post :notify_response
    end
  end

  #homepage
  root 'homepages#index'
  # api(url) = /api/v1/cards/:id/sort
  namespace :api do
    namespace :v1 do
      resources :cards, only: [] do
        member do
          patch :sort
          delete :remove 
        end
      end
      resources :containers, only: [] do
        member do
          delete :remove 
        end
      end
      # 目前不需要id 所以單數
      resource :calendars
    end
  end
end
