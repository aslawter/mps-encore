class ChangeColumnOnSolicitations < ActiveRecord::Migration
  def up
    change_column :solicitations, :description, :text
  end

  def down
    change_column :soliciations, :description, :string

  end
end
