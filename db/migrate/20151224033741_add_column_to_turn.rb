class AddColumnToTurn < ActiveRecord::Migration
  def change
  	add_reference :turns, :user, index: true
  	add_foreign_key :turns, :users
  end
end
