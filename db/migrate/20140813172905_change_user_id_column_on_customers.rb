class ChangeUserIdColumnOnCustomers < ActiveRecord::Migration
  def up
    change_column :customers, :user_id, "integer USING CAST(user_id AS integer)"
  end

  def down
  end
end
