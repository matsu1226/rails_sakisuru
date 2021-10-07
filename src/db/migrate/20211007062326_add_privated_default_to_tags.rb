class AddPrivatedDefaultToTags < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tags, :privated, from: nil, to: false
  end
end
