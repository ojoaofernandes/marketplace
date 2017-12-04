class Offer < ApplicationRecord
  belongs_to :user
  scope :all_ordered, -> { order view_count: :desc, title: :asc }
end
