Rails.application.routes.draw do
  devise_for :users
  resources :cards
  resources :boards
  resources :containers
  resources :calendars, only: [:index]

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
      # 目前不需要id 所以單數
      resource :calendars
    end
  end
end
