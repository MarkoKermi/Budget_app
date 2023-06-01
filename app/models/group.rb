class Group < ApplicationRecord
  # belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :author, class_name: 'User'
  has_many :payments

  validates :name, presence: true
  validates :user_id, presence: true
  validates :icon, presence: true
end
