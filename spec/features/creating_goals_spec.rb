require 'feature_helper'

feature 'Creating goals', type: :feature do
  given!(:user) { FactoryGirl.create(:user) }

  background do
    login_as(user, scope: :user)
  end

  scenario 'Creating a new goal' do
    title = Faker::Hipster.sentence
    visit '/goal/new'
    fill_in 'Title', with: title
    fill_in 'Description', with: Faker::Yoda.quote

    click_on 'Save'
    expect(page).to have_content(title)
  end
end