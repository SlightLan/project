Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get  '/upload_file(.:format)' , to: 'upload#index'
  post '/upload_file(.:format)' , to: 'upload#uploadFile'
 
  get  '/mainpage' , to: 'mainpage#index' , as: 'index_mainpage'

  get  '/userinfo' , to: 'userpage#show'  , as: 'show_user'
  get  '/userinfo/info' , to: 'userpage#info' , as: 'info_user'

  get  '/questions', to: 'question#index' , as: 'index_question'
  get  '/questions/new', to: 'question#create' , as: 'create_question'     
  post '/questions/new(.:format)', to: 'question#new' , as: 'new_question'
  get  '/questions/show/:id(.:format)', to: 'question#show' , as: 'question'
  post '/questions/show/:id(.:format)', to: 'comment#new' , as: 'new_comment'

  get '/star/question/:id', to: 'star#star_question' , as: 'star_question'
  get '/star/comment/:id' , to: 'star#star_comment'  , as: 'star_comment'
end