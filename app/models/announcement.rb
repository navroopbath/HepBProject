class Announcement < ActiveRecord::Base
  attr_accessible :date_written, :body, :pinned, :announcement_type, :title

end