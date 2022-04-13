class AddFavPlantToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fav_plant, :string
    add_reference :users, :region, foreign_key: true
  end
end
