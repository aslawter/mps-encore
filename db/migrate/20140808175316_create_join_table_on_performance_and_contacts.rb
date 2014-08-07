class CreateJoinTableOnPerformanceAndContacts < ActiveRecord::Migration
  def change
    create_join_table :performances, :contacts do |t|
      t.index :performance_id
      t.index :contact_id
      t.string :role, null: false, default: ""
      t.timestamps null: false
    end
  end
end
