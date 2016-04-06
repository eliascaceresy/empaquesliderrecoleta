class CreateTomaturnos < ActiveRecord::Migration
  def change
    create_table :tomaturnos do |t|

      t.timestamps null: false
    end
  end
end
