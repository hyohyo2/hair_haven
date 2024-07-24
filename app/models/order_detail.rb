class OrderDetail < ApplicationRecord

  enum making_status: { unable_manufacture: 0, waiting_for_manufacture: 1, in_production: 2, production_completed: 3 }

end
