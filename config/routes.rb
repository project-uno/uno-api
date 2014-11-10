Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :teachers, only: [] do
        collection do
          post :register
        end
      end

      resources :students, only: [] do
        collection do
          post :register
        end
      end
    end
  end
end
