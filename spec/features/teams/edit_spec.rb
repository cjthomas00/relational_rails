require 'rails_helper'

RSpec.describe 'Teams Index Page' do
  describe 'As a visitor' do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
    end
    describe 'When I visit a parent show page' do
      it "Next to every parent, I see a link to edit that parent's info" do
        visit '/teams'
        
        expect(page).to have_content("Update #{@team_1.name}")
        expect(page).to have_link("Update #{@team_1.name}", href: "/teams/#{@team_1.id}/edit")
      end

      it "When I click the link
      I should be taken to that parent's edit page where I can update its information" do
        visit '/teams'
        click_link("Update #{@team_1.name}")

        expect(current_path).to eq("/teams/#{@team_1.id}/edit")
      end
    end
  end
end