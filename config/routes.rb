Rails.application.routes.draw do
  

  #get 'home_pages/home'
  root 'home_pages#home'
  #get 'home_pages/help'
  get 'help'    => 'home_pages#help'
  #get 'home_pages/about'
  get 'about'   => 'home_pages#about'
  #get 'home_pages/contact'
  get 'contact' => 'home_pages#contact'
  #get 'users/new'
  get 'signup' =>'users#new'
  
  #get 'session/new'
  get 'signin' =>'session#new'
  post 'signin'=>'session#create'
  delete 'signout'=>'session#destroy'
  #get all resources users have index, show, new, create, edit, update,destroy
  resources :users
  
  
 
end
