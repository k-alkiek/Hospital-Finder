class StaticPagesController < ApplicationController
  def home
    @hospitals = Hospital.all
    @hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
      hospital_path = view_context.link_to hospital.name
      marker.lat hospital.latitude
      marker.lng hospital.longitude
      marker.infowindow "<b>#{hospital_path}</b>"
    end
  end

  def about
  end
end
