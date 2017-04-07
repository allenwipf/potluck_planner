class AddSlugToPotlucks < ActiveRecord::Migration
  def change
    add_column :potlucks, :slug, :string
  end
end
