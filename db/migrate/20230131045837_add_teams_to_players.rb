class AddTeamsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :teams, foreign_key: true
  end
end
