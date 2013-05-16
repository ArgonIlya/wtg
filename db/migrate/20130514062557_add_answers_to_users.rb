class AddAnswersToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :right, :int, default: 0
  	add_column :users, :wrong, :int, default: 0
  end
end
