class AddIeuBranchId < ActiveRecord::Migration[7.0]
  def up
    add_column :branches, :ieul_branch_id, :integer, null: false
  end

  def down
    remove_column :branches, :ieul_branch_id, :integer, null: false
  end
end
