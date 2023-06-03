class Group < ApplicationRecord
  belongs_to :user
  has_many :payment_items
  has_many :payments, through: :payment_items

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount_by_group(group_id)
    payments.joins(:payment_items).where(payment_items: { group_id: group_id }).sum('payments.amount')
  end
  
end
