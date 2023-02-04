require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'I see a welcome page' do
    visit '/'

    expect(page).to have_content('Welcome to the Hockey Index')
  end
end