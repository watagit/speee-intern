class AddColumnContractPriceToReview < ActiveRecord::Migration[7.0]
  def up
    add_column :reviews, :contract_price, :integer, null: false
  end

  def down
    remove_column :reviews, :contract_price, :integer, null: false
  end
end
