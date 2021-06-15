class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :toUserId
      t.references :listing, null: false, foreign_key: true
      t.text :content
      t.datetime :datetime

      t.timestamps
    end
  end
end
