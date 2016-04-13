class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :universidad, :string
  	add_column :users, :carrera, :string
  	add_column :users, :diacumpleaños, :integer
  	add_column :users, :mescumpleaños, :integer
  	add_column :users, :permission_level, :integer, default: 1
  end
end
