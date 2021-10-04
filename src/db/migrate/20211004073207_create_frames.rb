class CreateFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :frames do |t|
      t.string :statement
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.text :review_1
      t.text :review_2
      t.text :review_3
      t.text :review_4

      t.timestamps
    end
  end
end
