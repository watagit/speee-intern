class ChangeSellCountDataTypeToReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :sell_count, :string
  end
end
