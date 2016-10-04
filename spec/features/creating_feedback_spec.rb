require 'feature_helper'

feature 'Creating feedback', type: :feature do
  given!(:subject) { FactoryGirl.create(:user) }
  given!(:user) { FactoryGirl.create(:user) }
  given!(:feedback_request) { FactoryGirl.create(:feedback_request) }
  given!(:goal) { FactoryGirl.create(:goal) }

  background do
    login_as(user, scope: :user)
  end

  scenario 'unsolicited' do
    description = Faker::Yoda.quote
    visit "/feedback/new?user_id=#{subject.id}"
    page.select '9', :from => 'rating'
    fill_in 'description', with: description

    click_on 'Send feedback'
    expect(page).to have_content(subject.name)
  end

  scenario 'from a request' do
    description = Faker::Yoda.quote

    visit "/feedback/new?feedback_request_id=#{feedback_request.id}"
    page.select '9', :from => 'rating'
    fill_in 'description', with: description

    click_on 'Send feedback'
    expect(page).to have_content(feedback_request.requester.name)
  end

  scenario 'from a goal' do
    description = Faker::Yoda.quote

    visit "/feedback/new?goal_id=#{goal.id}"
    page.select '9', :from => 'rating'
    fill_in 'description', with: description

    click_on 'Send feedback'
    expect(page).to have_content(goal.owner.name)
  end

  scenario 'from a goal and for a user' do
    description = Faker::Yoda.quote

    visit "/feedback/new?goal_id=#{goal.id}&user_id=#{subject.id}"
    page.select '9', :from => 'rating'
    fill_in 'description', with: description

    click_on 'Send feedback'
    expect(page).to have_content(goal.owner.name)
  end

  scenario 'from a goal and a request' do
    description = Faker::Yoda.quote

    visit "/feedback/new?goal_id=#{goal.id}&feedback_request_id=#{feedback_request.id}"
    page.select '9', :from => 'rating'
    fill_in 'description', with: description

    click_on 'Send feedback'
    expect(page).to have_content(feedback_request.requester.name)
  end
end