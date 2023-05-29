class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :payments

  validates :name, presence :true
  validates :user_id, presence :true
  validates :string, presence :true
end
