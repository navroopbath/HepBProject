class Announcement < ActiveRecord::Base
  attr_accessible :date_written, :body, :pinned, :type

end