class AddTeamToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :team, foreign_key: true
  end
end

#rails g migration AddTeamToPlayers team:references
