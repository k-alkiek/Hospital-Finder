Rails.application.routes.draw do
  
  get 'static_pages/home'

  get 'static_pages/about'

  root 'static_pages#home'
  
  devise_for :hospitals, :controllers => { registrations: 'hospital/registrations' }
  devise_for :users, :controllers => { registrations: 'user/registrations' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
