Rails.application.routes.draw do
  root 'languages#home'

  post 'languages/search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
