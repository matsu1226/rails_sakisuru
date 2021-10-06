class Frame < ApplicationRecord
  validates :statement, presence: true, length: { maximum: 70 } 
  validates :text, presence: true, length: { maximum: 300 }

end
