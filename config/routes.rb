Rails.application.routes.draw do
  resources :short_uris

  root to: 'short_uris#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
