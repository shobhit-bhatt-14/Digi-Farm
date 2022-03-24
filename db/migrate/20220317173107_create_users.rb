class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.integer :phone
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
