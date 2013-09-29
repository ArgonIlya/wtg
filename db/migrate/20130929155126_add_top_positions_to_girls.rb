class AddTopPositionsToGirls < ActiveRecord::Migration
  def change
  	add_column :girls, :top_all, :int
  	add_column :girls, :top_girls, :int
  	add_column :girls, :top_actress, :int
  end
end
