require 'rails_helper'
context "user signed in on the homepage" do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  feature 'teams' do
    context 'no teams have been' do
      scenario 'should display a prompt to add a team' do
        visit '/teams'
        expect(page).to have_content 'No teams yet'
        expect(page).to have_link 'Add a team'
      end
    end
  end

  context 'Teams have been added' do
    before do
      Team.create(name: 'Kings XI')
    end

    scenario 'display teams' do
      visit '/teams'
      expect(page).to have_content('Kings XI')
      expect(page).not_to have_content('No teams yet')
    end
  end

  context 'creating teams' do
    scenario 'prompts user to fill out a form, then displays the new team' do
      visit '/teams'
      click_link 'Add a team'
      fill_in 'Name', with: 'Kings XI'
      click_button 'Create Team'
      expect(page).to have_content 'Kings XI'
      expect(current_path).to eq '/teams'
    end
  end
end
