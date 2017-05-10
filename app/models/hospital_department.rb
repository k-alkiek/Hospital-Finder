class HospitalDepartment < ApplicationRecord
  belongs_to :hospital
  belongs_to :department
end
