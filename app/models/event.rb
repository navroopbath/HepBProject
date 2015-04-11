class Event < ActiveRecord::Base
  attr_accessible :event_name, :location, :date, :duration, :num_volunteers, :description, :start_time, :end_time
  has_many :members, :through => :memevents
  has_many :memevents
end