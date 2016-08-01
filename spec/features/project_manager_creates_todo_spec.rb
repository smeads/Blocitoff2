require 'rails_helper'

feature 'Project manager creates TODO' do
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content('Your new TODO was saved')
    expect(page).to have_content('Meet up with the team')
  end

  scenario 'With description missing' do
    visit new_todo_path
    click_button 'Save'
    fill_in 'Description', with:
    click_button 'Save'
    # not sure if the first 4 steps are necessary. Seem like it's repeating
    # itself from the scenario above.
    expect(page).to have_content('New TODO saved unsuccessfully')
  end
end
