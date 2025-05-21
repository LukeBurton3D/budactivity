class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # activity_categories = ['Sport', 'Cooking Class', 'Theater', 'Skying', 'Food tour']
  # , inclusion: { in: activity_categories }
  validates :name, :category, :location, presence: true
  # :description
  validates :category, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
