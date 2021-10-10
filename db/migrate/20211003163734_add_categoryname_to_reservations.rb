class AddCategorynameToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :categoryname, :string
  end
end
