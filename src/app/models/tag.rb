class Tag < ApplicationRecord
  belongs_to :frame, foreign_key: "frame_id"

  validates :text, presence: true, length: { maximum: 50 }

end
