class AddRememberTokenUserToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token_user, :string
  	add_index  :users, :remember_token_user
  end
end
