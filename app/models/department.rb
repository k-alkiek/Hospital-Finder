class Department < ApplicationRecord
  has_many :hospital_departments
  has_many :hospitals, through: :hospital_departments 
end
