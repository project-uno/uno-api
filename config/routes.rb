Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :teachers, only: [:create]
      resources :students, only: [:create]
    end
  end
end
