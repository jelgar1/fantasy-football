require 'rails_helper'

feature 'teams' do
  context 'no teams have been' do
    scenario 'should display a prompt to add a team' do
      visit '/teams'
      expect(page).to have_content 'No teams yet'
      expect(page).to have_link 'Add a team'
    end
  end
end
