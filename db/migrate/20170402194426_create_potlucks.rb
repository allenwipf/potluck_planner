class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.string :title
      t.string :location
      t.string :description
      t.date :date
      t.time :time
      t.integer :party_size
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
