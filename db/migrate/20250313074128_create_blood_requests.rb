class CreateBloodRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :blood_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :blood_group
      t.string :location
      t.boolean :accepted

      t.timestamps
    end
  end
end
