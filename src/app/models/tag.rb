class Tag < ApplicationRecord
  belongs_to :frame, foreign_key: "frame_id"
end
