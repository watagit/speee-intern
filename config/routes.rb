Rails.application.routes.draw do
  root 'home#show'

  resources :branches, only: :show
  resources :reviews, only: :show
  resources :assessment_forms, only: %i[new create]
  resources :prefectures, only: :show
  resources :cities, only: :show
  resources :thanks, only: :index

  namespace :api do
    resources :prefectures, only: :show
  end
end
