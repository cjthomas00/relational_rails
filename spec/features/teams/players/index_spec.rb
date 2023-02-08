require 'rails_helper'

RSpec.describe 'Teams players index', type: :feature do
  describe 'As a visitor' do
    before :each do
      @team = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
      @joe = @team.players.create!(name: "Joe Sakic", jersey_number: 19, retired: true)
      @nate = @team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false)
      @artturi = @team.players.create!(name: "Artturi Lehkonen", jersey_number: 62, retired: false)
    end

    describe 'When I visit /team/:team_id/players' do
      it 'I see each player that is associated with that team with each players attributes' do
        visit "/teams/#{@team.id}/players"
       
        expect(page).to have_content(@joe.name)
        expect(page).to have_content(@nate.name)
        expect(page).to have_content(@joe.jersey_number)
        expect(page).to have_content(@nate.jersey_number)
        expect(page).to have_content(@joe.retired)
        expect(page).to have_content(@nate.retired)
      end
      
      it 'Then I see a link to sort players in alphabetical order' do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_link('Sort Alphabetically', href:"/teams/#{@team.id}/players?alphabetize=true")
      end

      it "When I click on the link
      I'm taken back to the team's players Index Page where I see all of the team's players in alphabetical order" do
        visit "/teams/#{@team.id}/players"
        click_link("Sort Alphabetically")

        expect(@artturi.name).to appear_before(@joe.name)
        expect(@joe.name).to appear_before(@nate.name)
        expect(@artturi.name).to appear_before(@nate.name)
        expect(current_path).to eq("/teams/#{@team.id}/players")
      end

      it 'I see a form that allows me to input a number value' do
        visit "/teams/#{@team.id}/players"

        expect(page).to have_content(@joe.name)
        expect(page).to have_content(@nate.name)
        expect(page).to have_content(@artturi.name)
        expect(page).to have_button "Only return players with a higher jersey number"
        expect(page).to have_field "Search by Jersey Number"
      end

      it "When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      Then I am brought back to the current index page with only the records that meet that threshold shown.
      " do
        visit "/teams/#{@team.id}/players"
        fill_in 'Search by Jersey Number', with: 21
        click_button "Only return players with a higher jersey number"

        expect(current_path).to eq("/teams/#{@team.id}/players")
        expect(page).to have_content(@nate.name)
        expect(page).to have_content(@artturi.name)
        expect(page).to_not have_content(@joe.name)
      end

      it "Next to every player, I see a link to delete that player" do
        visit "/teams/#{@team.id}/players"
        expect(page).to have_link("Delete #{@joe.name}")
        expect(page).to have_link("Delete #{@artturi.name}")
        expect(page).to have_link("Delete #{@nate.name}")
      end
    end
  end
end