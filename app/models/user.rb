class User < ApplicationRecord
  has_many :activities
  has_many :bookings
  # QUESTIONS
  # has_many :activities, through: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }, presence: true
  validates :description, presence: true, length: { in: 20..100 }
end
