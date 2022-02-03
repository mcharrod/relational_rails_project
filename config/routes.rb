Rails.application.routes.draw do
  get '/bogs', to: 'bogs#index'
  get '/bogs/:id', to: 'bogs#show'
end
