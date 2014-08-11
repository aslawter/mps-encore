class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :title, null: false
      t.belongs_to :customer, unique: true, null: false, index: true
      t.belongs_to :partner, null: false, index: true
      t.belongs_to :user, null: false, index: true
      t.boolean :prime_contractor, default: false, null: false
      t.string :contract_type, default: "", null: false
      t.string :contract_number, default: "", null: false
      t.decimal :value, precision: 10, scale: 2, default: 0, null: false
      t.date :starts_on, null: false
      t.date :ends_on, null: false
      t.timestamps null: false
    end

    add_index :performances, :contract_number, unique: true
  end
end
