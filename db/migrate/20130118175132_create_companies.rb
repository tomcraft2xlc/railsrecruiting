class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :street
      t.integer :number
      t.integer :cap
      t.string :link
      t.text :description
      t.date :funded

      t.timestamps
    end
  end
end
