require 'rails_helper'

RSpec.describe Group, type: :model do
  before :all do
    @group =
      Group.create(
        name: 'test category',
        icon: 'shopping_cart',
        user_id: User.first
      )
    @payment = Payment.create(
      name: 'weeky groceries',
      amount: 15.50,
      author_id: User.first.id
    )

    @payment_item = PaymentItem.create(
      payment_id: Payment.first.id,
      group_id: Group.first.id
    )
  end

  describe 'check category validity' do
    it 'is valid with valid attributes' do
      expect(@group).to be_valid
    end
  end

  describe 'check category invalidity' do
    it 'is invalid with invalid name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is invalid with invalid icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end

  describe '#total_amount' do
    it 'return total amount for category' do
      expect(@group.total_amount_by_group).to eql 0
    end
  end
end


