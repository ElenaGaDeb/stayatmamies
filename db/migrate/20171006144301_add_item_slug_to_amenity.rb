class AddItemSlugToAmenity < ActiveRecord::Migration[5.1]
  def change
    add_column :amenities, :item_slug, :string
  end
end
