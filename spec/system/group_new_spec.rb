require 'rails_helper'

describe 'Group new page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Username',
      email: 'user@gmail.com',
      password: 'password',
    )

    visit user_groups_path(user_id: @user.id)

    fill_in 'user_email', with: 'user@gmail.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    visit new_user_group_path(user_id: @user.id)
  end

  it 'I can see the Create button' do
    expect(page).to have_button('Create')
  end
  
  it 'I can create a new group' do
    fill_in 'new_group_name', with: 'Test Group'
    attach_file 'new_group_icon', Rails.root.join('spec', 'fixtures', 'img', 'test.png')
    click_button 'Create'
    expect(page).to have_current_path user_groups_path(user_id: @user.id)
  end
  
end