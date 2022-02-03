Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Look into "resources" if you haven't yet. They are more concise and easier to use/read.
  # They probably required you to handle roll routes for this project.
  # Reason being, they want to make sure you are confident hand rolling routes first.
  # Understanding how to hand role routes shows a fundamental concept and very important.

  # Below will give you the 7 default routes (index, show, new, create, edit, update, destroy)
  # Uncomment and run "rails routes" and you can see all the created routes,
  # their prefix/shortcut name, uri, and the controller and action it routes to.
  # resources :resource_name

  # get '/bogs', to: 'bogs#index'

  # For now, the only route used is "index", so we tell Rails to only create the "index"
  # route. You don't want to have routes that aren't being used.
  resources :bogs, only: :index
end
