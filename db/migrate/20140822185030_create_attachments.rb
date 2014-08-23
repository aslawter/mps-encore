class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file, default: "", null: false
      t.integer :user_id, null: false
      t.integer :updated_by_id, null: false
      t.integer :solicitation_id, null: false
      t.timestamps null: false
    end

    add_index :attachments, :solicitation_id
  end
end
