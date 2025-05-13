class EventAttendance < ApplicationRecord
  belongs_to :event_attendee, class_name: "User", foreign_key: :attendee_id
  belongs_to :attended_event, class_name: "Event"
end
