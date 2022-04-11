class AddPasswordDigestFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :password_digest, :string
  end
end
