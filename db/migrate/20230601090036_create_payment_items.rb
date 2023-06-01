class CreatePaymentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_items do |t|

      t.timestamps
    end
  end
end
