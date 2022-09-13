# frozen_string_literal: true

Rails.application.routes.draw do
  get '/ops/heartbeat', to: 'health_check#index'

  get '/branches/:id', to: 'branches#show'
  resources :assessment_forms, only: %i[new create]
end
