class HospitalsController < ApplicationController
  
  def show
    @hospital = Hospital.find(params[:id])
    
    @departments_selection = [];
    @departments = Department.all
    
    @departments.each do |department|
      if !(@hospital.departments.include? department)
        @departments_selection.push([department.name, department.name])
      end
    end
    
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