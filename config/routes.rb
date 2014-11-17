Rails.application.routes.draw do

  namespace :api, path: '/', constraints: { subdomain: 'api'} do
    namespace :v1 do
      resources :teachers, only: [ :create ]
      resources :students, only: [ :create ]
      resources :subjects, only: [ :show, :create , :update, :destroy ] 
      resources :sections, only: [ :index, :show, :create , :update, :destroy ] 
    end
  end
end
