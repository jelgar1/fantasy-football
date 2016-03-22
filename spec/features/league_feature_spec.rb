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
  context 'creating leagues' do
    scenario 'prompts user to fill out a form, then displays the new league' do
      visit '/leagues'
      click_link 'Create a league'
      fill_in 'Name', with: 'Turkcell Super Lig'
      fill_in 'Number of teams', with: '8'
      click_button 'Create League'
      expect(page).to have_content 'Turkcell Super Lig'
      expect(current_path).to eq '/leagues'
    end
  end
end
