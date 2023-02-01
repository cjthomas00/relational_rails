require 'rails_helper'

RSpec.describe 'the teams index page', type: :feature do
  describe "As a visitor" do
    describe "when I visit '/teams'" do
      it 'displays the team names' do
        team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
        team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
        
        visit '/teams'
        
        expect(page).to have_content(team_1.name)
        expect(page).to have_content(team_2.name)
      end
    end
  end
end