class Tag < ApplicationRecord
  belongs_to :frame, foreign_key: "frame_id"

  validates :text, presence: true, length: { maximum: 50 }

  AREA_NUM_VALUES = [1, 2, 3, 4]
  validates :area_num, inclusion: { in: AREA_NUM_VALUES }
  

end
