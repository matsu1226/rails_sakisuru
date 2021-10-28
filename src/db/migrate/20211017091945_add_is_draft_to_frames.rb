class AddIsDraftToFrames < ActiveRecord::Migration[6.1]
  def change
    add_column :frames, :is_draft, :boolean
    add_column :frames, :review, :text
    remove_column :frames, :review_1, :text
    remove_column :frames, :review_2, :text
    remove_column :frames, :review_3, :text
    remove_column :frames, :review_4, :text
  end
end
