class AddImagesToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :images, :text, array: true, default: []
  end
end
