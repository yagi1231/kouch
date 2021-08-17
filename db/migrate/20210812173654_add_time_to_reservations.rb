class AddToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :tel, :integer
    add_column :reservations, :returnhome, :string
    add_column :reservations, :remark, :string
    add_column :reservations, :time, :string
  end
end
