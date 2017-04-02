class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :amount
      t.string :claimed_by
      t.integer :potluck_id

      t.timestamps null: false
    end
  end
end
