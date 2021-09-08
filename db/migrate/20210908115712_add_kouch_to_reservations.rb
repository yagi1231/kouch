class AddKouchToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :tel, :string
    add_column :reservations, :time, :string
    add_column :reservations, :backtime, :string
    add_column :reservations, :telnum, :string
    add_column :reservations, :remarks, :string
  end
end
