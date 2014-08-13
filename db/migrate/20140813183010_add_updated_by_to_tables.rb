class AddUpdatedByToTables < ActiveRecord::Migration
  def up
    add_column :contacts, :updated_by_id, :integer, null: true
    update("UPDATE contacts SET updated_by_id = user_id")
    change_column_null :contacts, :updated_by_id, false

    add_column :customers, :updated_by_id, :integer, null: true
    update("UPDATE customers SET updated_by_id = user_id")
    change_column_null :customers, :updated_by_id, false

    add_column :partners, :updated_by_id, :integer, null: true
    update("UPDATE partners SET updated_by_id = user_id")
    change_column_null :partners, :updated_by_id, false

    add_column :performances, :updated_by_id, :integer, null: true
    update("UPDATE performances SET updated_by_id = user_id")
    change_column_null :performances, :updated_by_id, false

    add_column :performance_contacts, :updated_by_id, :integer, null: true
    update("UPDATE performance_contacts SET updated_by_id = user_id")
    change_column_null :performance_contacts, :updated_by_id, false
  end

  def down
    remove_column :performance_contacts, :updated_by_id

    remove_column :performances, :updated_by_id

    remove_column :partners, :updated_by_id

    remove_column :customers, :updated_by_id

    remove_column :contacts, :updated_by_id
  end
end
