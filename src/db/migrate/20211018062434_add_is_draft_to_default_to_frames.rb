class AddIsDraftToDefaultToFrames < ActiveRecord::Migration[6.1]
  def change
    change_column_default :frames, :is_draft, from: nil, to: true
  end
end
