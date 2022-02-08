Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/bogs', to: 'bogs#index'
  get '/bogs/new', to: 'bogs#new'
  get '/bogs/:id', to: 'bogs#show'
  post '/bogs', to: 'bogs#create'
  delete '/bogs/:id', to: 'bogs#destroy'
  get '/bogs/:id/edit', to: 'bogs#edit'
  patch '/bogs/:id', to: 'bogs#update'

  get '/frogs', to: 'frogs#index'
  get '/frogs/:id', to: 'frogs#show'
  get '/frogs/:id/edit', to: 'frogs#edit'
  patch '/frogs/:id', to: 'frogs#update'
  delete '/frogs/:id', to: 'frogs#destroy'

  get '/bogs/:id/frogs', to: 'bog_frogs#index'
  get '/bogs/:id/frogs/new', to: 'bog_frogs#new'
  post '/bogs/:id/frogs', to: 'bog_frogs#create'
end
