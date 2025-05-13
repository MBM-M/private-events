class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :event_attendee

  scope :upcoming, -> { where("event_date >= ?", Time.current).order(:event_date) }
  scope :past,     -> { where("event_date < ?", Time.current).order(event_date: :desc) }
end
