class AddReferenceToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :branch, foreign_key: true, null: false
  end
end
