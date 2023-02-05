class Player < ApplicationRecord
  belongs_to :team

  def self.active_player
    Player.all.where(retired: false)
  end
end