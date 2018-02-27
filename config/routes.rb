Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/upload_file(.:format)'  , to: 'upload#index'
  post '/upload_file(.:format)' , to: 'upload#uploadFile'
  post '/upload_file/showproject' , to: 'upload#showProjectFiles'
end
