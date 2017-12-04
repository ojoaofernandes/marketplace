class RemovePhotosFromOffers < ActiveRecord::Migration[5.1]
  def change
    remove_column :offers, :photos, :string
  end
end
