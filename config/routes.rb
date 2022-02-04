Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/bogs', to: 'bogs#index'
  get '/bogs/:id', to: 'bogs#show'

  get '/frogs', to: 'frogs#index'
  get '/frogs/:id', to: 'frogs#show'

  get '/bogs/:id/frogs', to: 'bog_frogs#index'
end
