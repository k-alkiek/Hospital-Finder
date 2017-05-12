class RemoveHospitalsDepartmentsTable < ActiveRecord::Migration[5.0]
  def change
    drop_join_table :hospitals, :departments
  end
end
