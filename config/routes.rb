Rails.application.routes.draw do
  devise_for :hospitals
  get 'static_pages/home'

  get 'static_pages/about'

  root 'static_pages#home'
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
