class AddPhotosToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :photos, :string, array: true, default: []
  end
end
