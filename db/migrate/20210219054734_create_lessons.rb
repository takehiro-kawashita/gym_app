class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.integer :level
      t.string :category
      t.datetime :started_at
      t.text :description
      t.integer :price
      t.string :instructor
      t.integer :limits

      t.timestamps
    end
  end
end
