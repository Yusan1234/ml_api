Rails.application.routes.draw do
  get 'request/connection'
  post 'request/connection'
  post 'uploader/create'
  get 'uploader/index'
  get 'uploader/form'
  post 'uploader/upload'
  get 'uploader/download'
  get 'request' => 'request#connection'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
