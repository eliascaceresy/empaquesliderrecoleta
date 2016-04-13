class AddColumnStateToTomaturnos < ActiveRecord::Migration
  def change
  	add_column :tomaturnos,:state, :string, default: "inactiva"
  end
end
