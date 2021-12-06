class AddKouchToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :time, :string
    add_column :reservations, :remarks, :string
  end
end
