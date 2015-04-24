class Memevent < ActiveRecord::Base
  attr_accessible :hours, :waitlisted, :date_added, :approved, :event_id, :member_id
  belongs_to :member
  belongs_to :event
end