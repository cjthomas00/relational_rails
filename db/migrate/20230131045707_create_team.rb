class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.boolean :original_six_team
      t.integer :number_of_stanley_cups

      t.timestamps
    end
  end
end
