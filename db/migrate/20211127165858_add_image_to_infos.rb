class AddImageToInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :infos, :image, :string
  end
end
