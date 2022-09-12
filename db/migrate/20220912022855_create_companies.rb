class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null:false
      t.string :logo_url, null:false
      t.string :catch_copy, null:false

      t.timestamps
    end
  end
end
