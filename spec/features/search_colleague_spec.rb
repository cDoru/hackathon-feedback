require 'feature_helper'

feature 'Searching for a colleague', type: :feature do
  given!(:user) { FactoryGirl.create(:user) }
  given(:roelof) { FactoryGirl.create(:user, name: "Roelof") }

  background do
    login_as(user, scope: :user)
  end

  scenario 'When I visit the home page' do
    visit '/dashboard/index'
    fill_in 'Search colleagues', with: 'Roelof\n'

    expect(page).to have_content('Roelof')
  end
end