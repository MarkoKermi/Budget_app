require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'tobby', email: 'tobby@example.com', password: 'samuel') }

  before do
    @group = Group.new(name: 'Test Group', user: user)
    @group.icon.attach(
      io: File.open(Rails.root.join('spec', 'fixtures', 'img', 'test.png')),
      filename: 'test.png',
      content_type: 'image/png'
    )
  end

  describe 'create group' do
    it 'should create group' do
      expect(@group).to be_valid
    end
  end

  describe 'validations' do
    it 'should be invalid, name must be present' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'should be invalid, icon must be present' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end



# describe 'Group new page', type: :feature do
#   before(:each) do
#     @user = User.create(
#       name: 'Username',
#       email: 'user@gmail.com',
#       password: 'password',
#       confirmed_at: Time.now
#     )

#     visit user_group_path

#     fill_in 'user_email', with: 'user@gmail.com'
#     fill_in 'user_password', with: 'password'
#     click_button 'Log in'

#     visit new_user_groups_path
#   end

#   it 'I can see the Create button' do
#     expect(page).to have_button('Create')
#   end

#   it 'I can create a new group' do
#     fill_in 'group_name', with: 'Test Group'
#     attach_file 'group_icon', Rails.root.join('spec', 'fixtures', 'files', 'test.png')
#     click_button 'Create'

#     expect(page).to have_current_path(groups_path)
#   end

#   it 'renders the new group form' do
#     render

#     expect(rendered).to have_selector('form[action="' + user_groups_path(user_id: current_user.id) + '"][method="post"]')
#     expect(rendered).to have_selector('input[name="group[name]"]')
#     expect(rendered).to have_selector('input[name="group[icon]"][type="file"]')
#     expect(rendered).to have_selector('input[type="submit"][value="Create"]')
#   end
# end

