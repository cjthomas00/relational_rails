class Player < ApplicationRecord
  belongs_to :team

  def self.active_players
    self.all.where(retired: false)
  end

  def self.filter_jersey(team_id, num)
    Player.where(team_id: team_id).where("jersey_number > #{num}")
  end

  def self.alpha(team_id)
    Player.where(team_id: team_id).order(:name)
  end
end