require 'rails_helper'

RSpec.describe 'the teams index page', type: :feature do
  describe "As a visitor" do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      sleep(1)
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      sleep(1)
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
    end
    describe "when I visit '/teams'" do
      it 'displays the team names' do
        visit '/teams'
        
        expect(page).to have_content(@team_1.name)
        expect(page).to have_content(@team_2.name)
      end

      it 'I see that records are ordered by most recently created first' do
        
        visit '/teams'
       
        expect(@team_2.name).to appear_before(@team_1.name)
        expect(@team_3.name).to appear_before(@team_2.name)
        expect(@team_1.name).to_not appear_before(@team_2.name)
        expect(@team_2.name).to_not appear_before(@team_3.name)
      end

      it 'shows when the team was created' do

        visit '/teams'
        
        expect(page).to have_content(@team_1.created_at)
        expect(page).to have_content(@team_2.created_at)
        expect(page).to have_content(@team_3.created_at)
      end
    end
  end
end