class AddReviewedAtToFrames < ActiveRecord::Migration[6.1]
  def change
    add_column :frames, :reviewed_at, :datetime
    add_column :frames, :released_at, :datetime
  end
end
