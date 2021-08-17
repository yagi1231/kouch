class AddImageNameToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :telnum, :string
    add_column :reservations, :backtime, :string
    add_column :reservations, :emarks, :string
    add_column :reservations, :order, :string
  end
end
