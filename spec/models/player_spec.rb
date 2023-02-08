require 'rails_helper'

RSpec.describe Player, type: :model do
  it {should belong_to :team}

  describe 'instance methods' do
    before :each do
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player3 = Player.create!(name: "Marion Gaborik", jersey_number: 10, retired: true, team: @team_3)
      @player4 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: @team_1)
    end

    describe 'active_players' do
      it 'only shows `true` Records' do
        expect(Player.active_players).to eq([@player1])
      end
    end

    describe 'filter_jersey' do
      it 'shows players with higher jersey number than others' do
        expect(Player.filter_jersey(@team_2.id, 18)).to eq([@player1, @player2])
      end
    end

    describe 'alpha' do
      it 'sorts players alphabetically by name' do
        expect(Player.alpha(@team_2.id)).to eq([@player2, @player1])
      end
    end
  end
end