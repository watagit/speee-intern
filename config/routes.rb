Rails.application.routes.draw do
  root 'home#show'

  resources :branches, only: :show
  resources :reviews, only: :show
  resources :assessment_forms, only: %i[new create]
  resources :prefectures, only: :show
  resources :cities, only: :show
  resources :thanks, only: :index

  get '/api/prefectures/:id/cities', to: 'prefectures#city'
end
