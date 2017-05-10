class AddPaperclipToHospital < ActiveRecord::Migration[5.0]
  def change
    add_attachment :hospitals, :image
  end
end
