require 'feature_helper'

feature 'Searching for a colleague', type: :feature do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:search) { FactoryGirl.create(:user) }

  background do
    login_as(user, scope: :user)
  end

  scenario 'When I visit the home page' do
    visit '/dashboard/index'
    fill_in 'Search for colleague', with: search.name
    find_field('Search for colleague').send_keys(:enter)

    expect(page).to have_content(search.name)
  end
end