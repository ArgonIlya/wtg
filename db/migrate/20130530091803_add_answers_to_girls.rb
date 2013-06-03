class AddAnswersToGirls < ActiveRecord::Migration
  def change
  	add_column :girls, :right, :int, default: 0
    add_column :girls, :wrong, :int, default: 0
  end
end
