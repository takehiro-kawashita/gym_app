class AddColumnUserInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :point, :integer
    add_column :users, :birthday, :datetime
    add_column :users, :address, :string
    add_column :users, :sex, :string
  end
end
