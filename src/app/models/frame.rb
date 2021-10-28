class Frame < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  has_many :tags, dependent: :destroy

  validates :statement, presence: true, length: { maximum: 70 } 
  validates :text, presence: true, length: { maximum: 300 }

end
