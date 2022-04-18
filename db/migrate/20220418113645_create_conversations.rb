class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :name
      t.boolean :is_private, default: false
      t.references :sender, null: false, foreign_key: {to_table: 'users'}
      t.references :receiver, null: false, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
