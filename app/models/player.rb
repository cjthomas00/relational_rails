class Player < ApplicationRecord
  belongs_to :team

  def self.active_players
    self.all.where(retired: false)
  end

  def self.filter_jersey(num)
    self.where("jersey_number > #{num}")
  end
end