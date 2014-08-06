class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :organization_id, null: false
      t.string :organization_type, null: false
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :title, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :fax, null: false, default: ""
      t.timestamps null: false
    end

    add_index :contacts, [:email], unique: true
    add_index :contacts, [:organization_id, :organization_type], unique: true
  end
end
