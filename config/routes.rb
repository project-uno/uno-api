Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api'} do
    namespace :v1 do

      resources :teachers, only: [ :index, :show, :create, :update, :destroy ] do
        resources :subjects, only: [ :index ]
      end

      resources :students, only: [ :show, :create, :update, :destroy ]
      resources :subjects, only: [ :show, :create , :update, :destroy ] 

      resources :sections, only: [ :index, :show, :create , :update, :destroy ] do
        resources :students, only: [ :index ]
      end
    end
  end
end
