class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false, default: ""
      t.boolean :federal, default: true, null: false
      t.timestamps null: false
    end

    add_index :customers, :name, unique: true
  end
end
