class CreatePerformanceContacts < ActiveRecord::Migration
  def change
    create_table :performance_contacts do |t|
      t.integer :performance_id, null: false
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
      t.string :role, null: false
      t.timestamps null: false
    end

    add_index :performance_contacts, [:performance_id, :contact_id], unique: true
    add_index :performance_contacts, [:performance_id, :role], unique: true
    add_index :performance_contacts, [:user_id]
  end
end
