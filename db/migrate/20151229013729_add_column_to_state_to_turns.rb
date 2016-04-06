class AddColumnToStateToTurns < ActiveRecord::Migration
  def change
  	add_column :turns, :state, :string, default: "free"
  end
end
