class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end
  
  # helper_method :resource_name, :resource, :devise_mapping
  
  # def resource_name
  #   :hospital  
  # end
 
  # def resource
  #   @resource ||= Hospital.new
  # end
 
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:hospital]
  # end
end
