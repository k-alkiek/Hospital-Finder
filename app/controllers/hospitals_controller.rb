class HospitalsController < ApplicationController
  autocomplete :hospital, :name
  
  def index
    @hospital = Hospital.find_by(name: params[:search])
    if @hospital
      redirect_to @hospital
      # redirect_back fallback_location: @hospital
    else 
       redirect_to root_path, :flash => {:alert => "Hospital not found"}
    end
    
    # redirect_back fallback_location: root_path
  end
  
  def show
    
    @hospital = Hospital.find(params[:id])
    
    @reviews = Review.where(:hospital_id => @hospital.id)
    @departments_selection = [];
    @departments = Department.all
    
    @departments.each do |department|
      if !(@hospital.departments.include? department)
        @departments_selection.push([department.name, department.name])
      end
    end
    
    @ratings = @reviews.collect do |review|
                        review.rating
                end
        
    @average = (@ratings.inject(:+).to_f / @ratings.size).round(2);

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
  
  def delete_department
    @hospital = Hospital.find(params[:id])
    @department = Department.find(params[:department_id])
    
    @hospital.departments.delete(@department)
    
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