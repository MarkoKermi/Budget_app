require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject do
    Payment.new(
      name: 'test payments',
      amount: 10.50,
      author_id: User.first
    )
  end

  describe 'check payment invalidity' do
    it 'is invalid with invalid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with invalid amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with negative amount' do
      subject.amount = -5.0
      expect(subject).to_not be_valid
    end
  end
end
