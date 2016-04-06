class AddColumnStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string, default: "activo"
    add_reference :users, :group, index: true 
    add_foreign_key :users,:groups
  end
end
