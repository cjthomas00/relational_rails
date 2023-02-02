class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.order_teams   # <=== use .self when calling a Class method
    self.order(created_at: :desc)
  end

  def player_count
    self.players.count
  end
end

