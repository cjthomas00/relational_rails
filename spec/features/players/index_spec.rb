require 'rails_helper'

RSpec.describe 'the players index page' do
  it 'displays the players and their attributes' do
    team_1 = Team.create!({name: 'Bruins', city: 'Boston', original_six_team: true, number_of_stanley_cups: 6})
    team_2 = Team.create!({name: 'Avalanche', city: 'Colorado', original_six_team: false, number_of_stanley_cups: 3})
    
    visit '/players'
  end
end