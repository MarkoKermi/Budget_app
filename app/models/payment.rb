class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :groups, through: :payment_items
  has_many :payment_items

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
