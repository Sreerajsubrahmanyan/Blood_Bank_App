class AddBloodGroupToDonations < ActiveRecord::Migration[8.0]
  def change
    add_column :donations, :blood_group, :string
  end
end
