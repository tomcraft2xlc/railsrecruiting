class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
