class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.integer :person
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :regions do |t|
      t.string :name

      t.timestamps
    end
  end
end
