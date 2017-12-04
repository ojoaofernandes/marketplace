class Offer < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :description, :price, :category

  scope :all_ordered, -> { order view_count: :desc, title: :asc }

  mount_uploaders :photos, PhotoUploader
  attr_accessor :photos_cache
end
