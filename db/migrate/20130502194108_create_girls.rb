class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.string :about
      t.boolean :actress
      
      t.timestamps
    end
  end
end