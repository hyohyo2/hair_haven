class Item < ApplicationRecord

  enum kind: { female_wig: 0, male_wig: 1, accessory: 2 }
  enum size: { double_small: 0, small: 1, medium: 2, large: 3, double_large: 4 }
  enum length: { short_hair: 0, bob_hair: 1, medium_hair: 2, long_hair: 3 }
end
