Rails.application.routes.draw do
  root 'uploader#index'
  resources :uploader 
  
  get 'request/connection'
  post 'request/connection'
  get 'request' => 'request#connection'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
