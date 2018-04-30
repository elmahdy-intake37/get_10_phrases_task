Rails.application.routes.draw do
  root 'phrases#home'
  resources :phrases
  get '/phrase', to: 'phrases#get_10'
  post '/phrase/post', to: 'phrases#get_10'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
