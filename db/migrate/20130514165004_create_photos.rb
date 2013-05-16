class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.references :girl

      t.timestamps
    end
    add_index :photos, :girl_id
  end
end