class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	after_create :welcome_send
	
	has_many :attendances
  has_many :events, through: :attendances
  has_many :created_events, class_name: "Event", foreign_key: 'admin_id'
  has_many :attended_events, class_name: "Event", foreign_key: 'attendee_id'



  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
