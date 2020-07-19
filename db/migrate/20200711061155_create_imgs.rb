class CreateImgs < ActiveRecord::Migration[5.2]
  def change
    create_table :imgs do |t|
      t.string :imgName
      t.string :path

      t.timestamps
    end
  end
end
