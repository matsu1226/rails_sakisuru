class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :frame, null: false, foreign_key: true
      t.text :text
      t.integer :area_num
      t.boolean :privated

      t.timestamps
    end
  end
end
