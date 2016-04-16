class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :dia
      t.string :horainicio
      t.string :horatermino

      t.timestamps null: false
    end
  end
end
