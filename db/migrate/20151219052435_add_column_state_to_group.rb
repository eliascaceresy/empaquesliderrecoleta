class AddColumnStateToGroup < ActiveRecord::Migration
  def change

  	add_column :groups, :state,:string, default: "inactivo"
  end
end
