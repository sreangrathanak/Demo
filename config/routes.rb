Rails.application.routes.draw do
  get 'users/new'

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
  
  
  
 
end
