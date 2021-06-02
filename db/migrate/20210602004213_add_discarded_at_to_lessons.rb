class AddDiscardedAtToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :discarded_at, :datetime
    add_index :lessons, :discarded_at
  end
end
