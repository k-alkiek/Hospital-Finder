class HospitalsController < ApplicationController
  
  def show
    @hospital = Hospital.find(params[:id])
    #@reviews = Review.where(:hospital_id => @hospital.id)
    
    
    @hospitals = [@hospital]
    @hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
      marker.lat hospital.latitude
      marker.lng hospital.longitude
    end
  end
  
  def add_department
    @hospital = Hospital.find(params[:id])
    @department = Department.find_by(name: params[:department_name])
    
    @hospital.departments << @department
    redirect_back fallback_location: @hospital
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