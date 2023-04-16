Rails.application.routes.draw do
  resources :cards
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
