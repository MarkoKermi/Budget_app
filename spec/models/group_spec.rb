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
