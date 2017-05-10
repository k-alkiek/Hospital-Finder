class Hospital < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :reviews, dependent: :destroy
  
    has_many :hospital_departments
    has_many :departments, through: :hospital_departments
  
end
