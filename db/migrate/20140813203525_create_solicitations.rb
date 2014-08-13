class CreateSolicitations < ActiveRecord::Migration
  def change
    create_table :solicitations do |t|
      t.integer :customer_id, null: false
      t.integer :partner_id, null: false
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :office, null: false, default: ""
      t.string :solicitation_number, null: false, default: ""
      t.datetime :deadline, null: false
      t.boolean :submitted, null: false, default: false
      t.boolean :prime_contractor, null: false, default: false
      t.boolean :won, null: false, default: false
      t.integer :updated_by_id, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end

    add_index :solicitations, [:customer_id, :partner_id, :user_id]
    add_index :solicitations, [:solicitation_number], unique: true
  end
end
