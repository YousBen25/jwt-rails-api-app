class AddLocationColumnToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :json, default: {}
  end
end
