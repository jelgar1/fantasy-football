require 'rails_helper'

feature 'leagues' do
  context 'no leagues have been added' do
    scenario 'should display a prompt to add or join a league' do
      visit '/leagues'
      expect(page).to have_content 'You don\'t belong to any leagues'
      expect(page).to have_link 'Create a league'
      expect(page).to have_link 'Join a league'
    end
  end
end
