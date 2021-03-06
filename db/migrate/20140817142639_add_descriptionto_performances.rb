class AddDescriptiontoPerformances < ActiveRecord::Migration
  def up
    add_column :performances, :description, :text, default: "", null: true
    update("Update performances SET description = 'No description provided'")
    change_column_null :performances, :description, false
  end

  def down
    remove_column :performances, :description
  end
end
