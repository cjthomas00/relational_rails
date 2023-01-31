require 'rails_helper'

RSpec.describe 'the teams index page' do
#   For each parent table
#   As a visitor
#   When I visit '/parents'
#   Then I see the name of each parent record in the system
  it 'displays the team names' do
    team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
    team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
    
    visit '/teams'
    
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end

  it 'displays a single teams attributes' do
    team = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
    team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})

    visit "teams/#{team.id}"
  end
end