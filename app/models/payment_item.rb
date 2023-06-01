class PaymentItem < ApplicationRecord
  belongs_to :group
  belongs_to :payment
end
