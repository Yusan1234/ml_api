class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo_name
      t.binary :photo_img

      t.timestamps
    end
  end
end
