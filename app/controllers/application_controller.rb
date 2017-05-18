class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  helper_method :resource_name, :resource, :devise_mapping
  
  def after_sign_in_path_for(resource) 
    @hospital = current_hospital
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
