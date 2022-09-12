class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.references :prefecture, foreign_key: true, null: false

      t.timestamps
    end
  end
end
