Rails.application.routes.draw do

  root 'subs#index'
  
  resources :subs do 
    resources :topics
  end
  # get '/subs', to: 'sub#index'
  # get '/subs/:id', to: 'subs#show'
  # get '/subs/:id', to: 'subs#edit'
  # put '/subs/:id', to: 'subs#update'
  # delete '/subs/:id', to: 'subs#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
