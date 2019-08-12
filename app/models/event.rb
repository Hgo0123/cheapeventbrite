class Event < ApplicationRecord
	has_many :attendances
    has_many :users, through: :attendances
   validates :start_date, presence: true
   validate :future_event
   validates :duration, presence: true, numericality: {greater_than: 0}
   validate :multiple_of_5
   validates :title, presence: true, length: { minimum: 5, maximum: 140}
   validates :description, presence: true, length: { minimum: 20, maximum: 1000}
   validates :price, presence: true, numericality: {greater_than: 0, less_than: 1000}
   validates :location, presence: true

   private

  def future_event
    errors.add(:date, "Can't be in the past!") if start_date < Time.now
  end

  def multiple_of_5
  	errors.add(:duration, "must be a multiple of 5") if (duration % 5) != 0
  end
end
