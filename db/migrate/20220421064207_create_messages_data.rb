class CreateMessagesData < ActiveRecord::Migration[7.0]
  def change
    create_table :message_values do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
