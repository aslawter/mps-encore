class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.integer :performance_id, null: false
      t.integer :solicitation_id, null: false
      t.timestamps null: false
      t.integer :user_id, null: false
      t.integer :updated_by_id, null: false
    end
    
    add_index :opportunities, [:performance_id, :solicitation_id], unique: true
  end
end
