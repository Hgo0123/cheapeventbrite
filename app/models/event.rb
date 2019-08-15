class Event < ApplicationRecord
  has_one_attached :avatar
	belongs_to :admin, :foreign_key => :admin_id, class_name: 'User'
  belongs_to :attendee, :foreign_key => :attendee_id, class_name: 'User', optional: true
  has_many :attendances
  has_many :users, through: :attendances

  validates :avatar, presence: true
   validates :start_date, presence: true
   validate :future_event
   validates :duration, presence: true, numericality: {greater_than: 0}
   validate :multiple_of_5
   validates :title, presence: true, length: { minimum: 5, maximum: 140}
   validates :description, presence: true, length: { minimum: 20, maximum: 1000}
   validates :price, presence: true, numericality: {greater_than: 0, less_than: 1000}
   validates :location, presence: true
   
   def message_time
      start_date.strftime("%d/%m/%y | %l:%M %p")
    end
    def the_end
         @end = (start_date + duration.minute)
           @the_end = @end.strftime("%d/%m/%y | %l:%M %p")
     end



   private

  def future_event
    if start_date == nil
      puts "Vous devez renseigner une date de debut"
    else
    errors.add(:date, "Can't be in the past!") if start_date < Time.now
  end
  end

  def multiple_of_5
    if duration == nil
    puts "Vous dvez renseignez une durée"
    else
  	errors.add(:duration, "must be a multiple of 5") if (duration % 5) != 0
    end
  end
 
end
