class ChangeUserIdColumnOnCustomers < ActiveRecord::Migration
  def change
    change_column :customers, :user_id, "integer USING CAST(user_id AS integer)" 
  end
end
