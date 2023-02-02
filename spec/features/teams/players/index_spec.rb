# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'Teams players index', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit /team/:team_id/players' do
      it 'I see each player that is associated with that team with each players attributes' do
        team = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
        joe = team.players.create!(name: "Joe Sakic", jersey_number: 19, retired: true)
        nate = team.players.create!(name: "Nathan MacKinnon", jersey_number: 29, retired: false)

        visit "/teams/#{team.id}/players"
        save_and_open_page  
        expect(page).to have_content(joe.name)
        expect(page).to have_content(nate.name)
        expect(page).to have_content(joe.jersey_number)
        expect(page).to have_content(nate.jersey_number)
        expect(page).to have_content(joe.retired)
        expect(page).to have_content(nate.retired)
      end
    end
  end
end