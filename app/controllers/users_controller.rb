class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  # helper_method :resource_name, :resource, :devise_mapping
  
  # def resource_name
  #   :user  
  # end
 
  # def resource
  #   @resource ||= User.new
  # end
 
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
end