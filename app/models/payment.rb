class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :groups


  validates :amount, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
