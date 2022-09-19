class AddReviewHashToReviewTable < ActiveRecord::Migration[7.0]
  def up
    add_column :reviews, :review_digest, :string, null: false
  end

  def down
    remove_column :reviews, :review_digest, :string, null: false
  end
end
