class Team < ApplicationRecord
  has_many :players

  def self.order_teams   # <=== use .self when calling a Class method
    self.order(created_at: :desc)
  end
end

