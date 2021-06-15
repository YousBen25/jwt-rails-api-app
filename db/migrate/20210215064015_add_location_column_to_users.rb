class AddLocationColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :location, :json, default: {}
  end
end
