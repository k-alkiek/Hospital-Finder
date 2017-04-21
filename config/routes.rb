Rails.application.routes.draw do

  get 'users/:id' => 'users#show'
  
  get 'hospitals/:id' => 'hospitals#show'
  
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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
