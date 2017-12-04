class Offer < ApplicationRecord
  scope :all_ordered, -> { order view_count: :desc, title: :asc }
end
