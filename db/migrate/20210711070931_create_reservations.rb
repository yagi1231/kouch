class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :address
      t.string :delivery
      t.integer :price

      t.timestamps
    end
  end
end
