require 'rails_helper'

RSpec.describe payment, type: :model do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @group = Group.create(name: 'Test group', icon: 'http://example.com', author_id: @user.id)
    @payment = payment.create(name: 'Test payment', amount: 100, author_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@payment).to be_valid
  end
  it 'is not valid without a name' do
    @payment.name = nil
    expect(@payment).to_not be_valid
  end
  it 'is not valid without an amount' do
    @payment.amount = nil
    expect(@payment).to_not be_valid
  end
  it 'is not valid without an author_id' do
    @payment.author_id = nil
    expect(@payment).to_not be_valid
  end
end
