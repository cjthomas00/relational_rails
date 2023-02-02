require 'rails_helper'

RSpec.describe 'the teams show page', type: :feature do
  describe "As a visitor" do
    
    describe "When I visit '/teams/:id" do
      it 'Then I see the parent with that id including the parents attributes' do
        team = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
    
        visit "/teams/#{team.id}"
      
        expect(page).to have_content(team.name)
        expect(page).to_not have_content(team_2)
      end

      it 'I see a count of the number of children associated with this parent' do
          team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
          sleep(1)
          team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
          sleep(1)
          team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
          player1 = Player.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false, team: team_2)
          player2 = Player.create!(name: "Joe Sakic", jersey_number: 19, retired: true, team: team_2)
          player3 = Player.create!(name: "Marion Gaborik", jersey_number: 10, retired: true, team: team_3)
          player4 = Player.create!(name: "Bobby Orr", jersey_number: 4, retired: true, team: team_1)

          visit "/teams/#{team_1.id}"
      end
    end
  end
end