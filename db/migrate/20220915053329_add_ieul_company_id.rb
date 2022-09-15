class AddIeulCompanyId < ActiveRecord::Migration[7.0]
  def up
    add_column :companies, :ieul_company_id, :integer, null: false
  end

  def down
    remove_column :companies, :ieul_company_id, :integer, null: false
  end
end
