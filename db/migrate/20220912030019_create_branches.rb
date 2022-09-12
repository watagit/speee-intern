class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :zip_code, null:false 
      t.string :phone_number
      t.string :fax_number
      t.string :business_hours
      t.string :closed_day
      t.string :introduction, null:false
      t.string :after_address, null:false
      t.references :company, foreign_key: true, null:false
      t.references :city, foreign_key: true, null:false

      t.timestamps
    end
  end
end
