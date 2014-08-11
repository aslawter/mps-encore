class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :user_id, null: false
      t.string :name, null: false, default: ""
      t.boolean :federal, default: true, null: false
      t.timestamps null: false
    end

    add_index :customers, :name, unique: true
    add_index :customers, :user_id
  end
end
