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

  context 'the user belongs to a league' do
    before do
      League.create(name: 'Turkcell Super Lig')
    end

    scenario 'display leagues' do
      visit '/leagues'
      expect(page).to have_content('Turkcell Super Lig')
      expect(page).not_to have_content('You don\'t belong to any leagues')
    end
  end
end
