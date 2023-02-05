class Player < ApplicationRecord
  belongs_to :team

  def self.active_players
    Player.all.where(retired: false)
  end
end