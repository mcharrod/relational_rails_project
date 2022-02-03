Rails.application.routes.draw do
  get '/bogs', to: 'bogs#index'
  get '/bogs/:id', to: 'bogs#show'

  get '/frogs', to: 'frogs#index'
  get '/frogs/:id', to: 'frogs#show'
end
