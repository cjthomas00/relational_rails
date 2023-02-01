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
    end
  end
end