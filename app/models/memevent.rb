class Memevent < ActiveRecord::Base
  attr_accessible :hours, :waitlisted, :date_added
  belongs_to :member
  belongs_to :event
end