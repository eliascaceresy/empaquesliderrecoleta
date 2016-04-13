class AddColumnNumdiaToTurns < ActiveRecord::Migration
  def change
  	add_column :turns, :numdia,:integer
  end
end
