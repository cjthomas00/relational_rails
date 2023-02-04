require 'rails_helper'

RSpec.describe 'the teams index page', type: :feature do
  describe "As a visitor" do
    before :each do 
      @team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
      #sleep(1)
      @team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      # sleep(1)
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
        expect(current_path).to eq("/teams/#{new_team_id}")
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

        visit '/teams'
        expect(page).to have_content("Golden Knights")
      end
    end
  end
end