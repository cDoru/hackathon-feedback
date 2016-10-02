require 'feature_helper'

feature 'Logging in', type: :feature do
  given(:user) { FactoryGirl.create(:user) }

  background do
    login_as(user, scope: user)
  end

  scenario 'When I visit the home page' do
    visit '/home/index'

    expect(page).to have_content(user.name)
  end
end