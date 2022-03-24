class CreateDiscussions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.text :content
      t.integer :count, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :region, null:false, foreign_key: true

      t.timestamps
    end
  end
end
