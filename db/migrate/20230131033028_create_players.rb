class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :jersey_number
      t.boolean :retired
      
      t.timestamps 
    end
  end
end
