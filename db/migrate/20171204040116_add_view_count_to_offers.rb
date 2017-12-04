class AddViewCountToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :view_count, :integer, default: 0
  end
end
