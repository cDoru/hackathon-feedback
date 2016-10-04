require 'feature_helper'

feature 'Creating feedback request', type: :feature do
  given!(:invitee) { FactoryGirl.create(:user) }
  given!(:user) { FactoryGirl.create(:user) }

  given!(:goal) { FactoryGirl.create(:goal) }

  background do
    login_as(user, scope: :user)
  end


  scenario 'from a goal' do
    description = Faker::Yoda.quote
    title = Faker::Hipster.sentence

    visit "/feedback_request/new?goal_id=#{goal.id}"

    fill_in 'description', with: description
    fill_in 'title', with: title

    page.check(invitee.name)

    click_on 'Save changes'
    expect(page).to have_content(invitee.name)
  end

  scenario 'without a goal' do
    description = Faker::Yoda.quote
    title = Faker::Hipster.sentence

    visit "/feedback_request/new"

    fill_in 'description', with: description
    fill_in 'title', with: title

    page.check(invitee.name)

    click_on 'Save changes'
    expect(page).to have_content(invitee.name)
  end
end