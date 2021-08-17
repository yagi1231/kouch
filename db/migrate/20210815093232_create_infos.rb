class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :name
      t.string :address
      t.string :telnum
      t.string :remark

      t.timestamps
    end
  end
end
