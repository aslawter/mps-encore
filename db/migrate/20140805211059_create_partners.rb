class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id, null: false
      t.string :name, null: false, default: ""
      t.string :website, null: false, default: ""
      t.boolean :enabled, null: false, default: true
      t.timestamps null: false
    end

    add_index :partners, :name, unique: true
    add_index :partners, :website, unique: true
    add_index :partners, :user_id
  end
end
