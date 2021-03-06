Rails.application.routes.draw do
  
  get 'static_pages/home'

  get 'static_pages/about'
  
  root 'static_pages#home'
  
  devise_for :hospitals, :controllers => {
    registrations: 'hospital/registrations',
    sessions: 'hospital/sessions'
  }
  devise_for :users, :controllers => {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }
  
  
  
   #get 'users/:id' => 'users#show'
  resources :users, only: [:show]
  # get 'hospitals/:id' => 'hospitals#show' 
  
  get 'hospitals/autocomplete_hospital_name'
  
  resources :hospitals do
    get 'delete_department', on: :member
    get 'add_department', on: :member
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end