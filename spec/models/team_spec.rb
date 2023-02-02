require 'rails_helper'

RSpec.describe Team, type: :model do
  it {should have_many :players}

  describe 'instance methods' do
    describe '##self.order_teams' do
      before :each do
        
        @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        sleep(1)
        @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
        sleep(2)
        @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
      end
      it 'can order teams by most recently created' do
        expect(Team.order_teams).to eq([@team_3, @team_2, @team_1])
      end
    end
  end
end