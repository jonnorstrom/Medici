class AddFullName < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :full_name, :string)
    change_column :users, :first_name, :string, :null => true
    change_column :users, :last_name, :string, :null => true
  end
end
