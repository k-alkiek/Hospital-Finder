class CreateJoinTableHospitalDepartment < ActiveRecord::Migration[5.0]
  def change
    create_join_table :hospitals, :departments do |t|
      t.index [:hospital_id, :department_id]
    end
  end
end
