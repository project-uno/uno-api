Rails.application.routes.draw do

  resources :teachers, only: [] do
    collection do
      post :register
    end
  end
end
