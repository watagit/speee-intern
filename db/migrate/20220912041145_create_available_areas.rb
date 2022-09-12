class CreateAvailableAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :available_areas do |t|
      t.references :city, foreign_key: true, null: false
      t.references :branch, foreign_key: true, null: false

      t.timestamps
    end
  end
end
