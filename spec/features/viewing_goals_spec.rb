require 'feature_helper'

feature 'Viewing goals', type: :feature do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:other_user) { FactoryGirl.create(:user) }
  given!(:my_goal) { FactoryGirl.create(:goal, owner: user)}
  given!(:other_goal) { FactoryGirl.create(:goal, owner: other_user)}

  background do
    login_as(user, scope: :user)
  end

  scenario 'Viewing my goals' do
    visit '/goal/index'

    expect(page).to have_content(my_goal.title)
  end

  scenario 'Viewing someone else goals' do
    visit "/goal/index?user_id=#{other_user.id}"

    expect(page).to have_content(other_goal.title)
    expect(page).not_to have_content(my_goal.title)
  end
end