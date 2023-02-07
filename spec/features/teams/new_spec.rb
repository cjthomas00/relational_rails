require 'rails_helper'

RSpec.describe 'Teams Index Page' do
  describe 'As a visitor' do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @team_3 = Team.create!({name: 'Wild', city: 'Minnesota', original_six_team: false, number_of_stanley_cups: 0})
    end
    it 'Then I see a link to create a new Parent record, "New Parent"' do
      visit '/teams'

      expect(page).to have_link('New Team', href:"/teams/new")
    end

    it 'When I click this link
    Then I am taken to "/parents/new" where I  see a form for a new parent record' do
      visit '/teams'
      click_link("New Team")

      expect(current_path).to eq('/teams/new')
    end

    it "When I fill out the form with a new parent's attributes:
    And I click the button 'Create Parent' to submit the form
    Then a `POST` request is sent to the '/parents' route" do
      visit '/teams/new'
      fill_in('Name', with: 'Golden Knights') 
      fill_in('City', with: 'Las Vegas')
      uncheck('original_six_team')
      fill_in('number_of_stanley_cups', with: 0)
      click_button('Create Team')

      new_team_id = Team.last.id
      expect(current_path).to eq("/teams")
      expect(page).to have_content("Golden Knights")
    end

    it "a new parent record is created,
    and I am redirected to the Parent Index page where I see the new Parent displayed." do
      visit '/teams/new'
      fill_in('Name', with: 'Golden Knights') 
      fill_in('City', with: 'Las Vegas')
      uncheck('original_six_team')
      fill_in('number_of_stanley_cups', with: 0)
      click_button('Create Team')

      expect(page).to have_content("Golden Knights")
    end
  end
end
