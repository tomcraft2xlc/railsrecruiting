class AddInfoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :jobDescription, :text

    add_column :jobs, :companyDescription, :text

    add_column :jobs, :desiredSkills, :text

  end
end
