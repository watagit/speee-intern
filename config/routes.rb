Rails.application.routes.draw do
  root 'home#show'

  get '/ops/heartbeat', to: 'health_check#index'
  get '/thanks', to: 'thanks#show'

  resources :branches, only: :show
  resources :reviews, only: :show
  resources :assessment_forms, only: %i[new create]
  resources :prefectures, only: :show
  resources :cities, only: :show

  get '/api/prefectures/:id/cities', to: 'prefectures#city'
end
