class AddColumnToTomaturnos < ActiveRecord::Migration
  def change
  	add_column :tomaturnos, :canmaxsemana, :integer, default: 0
  end
end
