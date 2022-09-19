# frozen_string_literal: true

Rails.application.routes.draw do
  get '/ops/heartbeat', to: 'health_check#index'

  get '/branches/:id', to: 'branches#show'
  get '/thanks', to: 'thanks#show'
  get '/prefectures/:id', to: 'prefectures#show'
  
  resources :reviews, only: :show
  resources :assessment_forms, only: %i[new create]

  get '/api/prefectures/:id/cities', to: 'prefectures#city'
end
