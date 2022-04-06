class CreateCropProductions < ActiveRecord::Migration[7.0]
  def change
    create_table :crop_productions do |t|
      t.string :year
      t.string :crop
      t.float :value

      t.timestamps
    end
  end
end
