class CreateHospitals < ActiveRecord::Migration[5.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :phone
      t.text :about

      t.timestamps
    end
  end
end
