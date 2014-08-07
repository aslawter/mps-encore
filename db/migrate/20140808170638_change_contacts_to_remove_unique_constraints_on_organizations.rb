class ChangeContactsToRemoveUniqueConstraintsOnOrganizations < ActiveRecord::Migration
  def up
    remove_index :contacts, [:organization_id, :organization_type] 
    add_index :contacts, [:organization_id, :organization_type]
  end

  def down
    remove_index :contacts, [:organization_id, :organization_type]
    add_index :contacts, [:organization_id, :organization_type], unique: true
  end
end
