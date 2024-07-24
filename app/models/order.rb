class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

end
