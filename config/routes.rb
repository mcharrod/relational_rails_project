Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/bogs', to: 'bogs#index'
  get '/bogs/new', to: 'bogs#new'
  get '/bogs/:id', to: 'bogs#show'
  post '/bogs', to: 'bogs#create'

  get '/frogs', to: 'frogs#index'
  get '/frogs/:id', to: 'frogs#show'

  get '/bogs/:id/frogs', to: 'bog_frogs#index'
end
