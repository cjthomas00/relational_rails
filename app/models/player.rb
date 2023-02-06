class Player < ApplicationRecord
  belongs_to :team

  def self.active_players
    self.all.where(retired: false)
  end
end