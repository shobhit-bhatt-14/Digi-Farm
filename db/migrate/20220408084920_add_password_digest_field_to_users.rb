class AddPasswordDigestFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :password_digest, :string

    rename_column :users, :fname, :first_name
    rename_column :users, :lname, :last_name
  end
end
