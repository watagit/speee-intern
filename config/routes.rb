Rails.application.routes.draw do
  get '/ops/heartbeat', to: 'health_check#index'

  get '/branches/:id', to: 'branches#show'
end
