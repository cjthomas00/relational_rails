require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

  describe 'instance methods' do
    before :each do
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      sleep(1)
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      sleep(1)
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
      @player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: @team_2)
      @player2 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: @team_2)
      @player3 = Player.create!(name: "Marion Gaborik", jersey_number: 10, retired: true, team: @team_3)
      @player4 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: @team_1)
    end

    describe '##self.order_teams' do
      it 'can order teams by most recently created' do
        expect(Team.order_teams).to eq([@team_3, @team_2, @team_1])
      end
    end

    describe '#count_of_players' do
      it 'counts the number of players' do
        expect(@team_1.player_count).to eq(1)
        expect(@team_2.player_count).to eq(2)
        expect(@team_3.player_count).to eq(1)
      end
    end
  end
end