class Event < ActiveRecord::Base

  attr_accessible :name, :date, :location, :description, :start_time, :duration, :num_volunteers, :num_waitlist
  has_many :member

end