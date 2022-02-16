class AddPriceTopri < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :pri, :string
  end
end
