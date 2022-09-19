# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#show'

  get '/ops/heartbeat', to: 'health_check#index'
  get '/branches/:id', to: 'branches#show'
  get '/thanks', to: 'thanks#show'
  resources :assessment_forms, only: %i[new create]
  resources :prefectures, only: :show

  get '/api/prefectures/:id/cities', to: 'prefectures#city'
end
