class CreateCropProductions < ActiveRecord::Migration[7.0]
  def change
    create_table :crop_productions do |t|
      t.references :crop, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
