class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :admin, :boolean, default: false, null: false
    add_column :users, :approver, :boolean, default: false, null: false
    add_column :users, :active, :boolean, default: false, null: false
  end
end
