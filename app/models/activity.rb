class Activity < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  activity_categories = ['Sport', 'Cooking Class', 'Theater', 'Skying', 'Food tour']

  validates :name, :description, :category, :location, presence: true
  validates :activity_categories, inclusion: { in: activity_categories }, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # Dates ?
end
