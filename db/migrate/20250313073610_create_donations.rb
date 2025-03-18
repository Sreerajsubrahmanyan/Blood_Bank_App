class CreateDonations < ActiveRecord::Migration[8.0]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :weight
      t.date :last_donation_date
      t.string :location

      t.timestamps
    end
  end
end
