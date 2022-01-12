class AddCategorynameToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :categoryname, :string
    add_column :reservations, :image, :string
  end
end
