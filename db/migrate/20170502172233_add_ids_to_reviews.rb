class AddIdsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :hospital_id, :integer
  end
end
