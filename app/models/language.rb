class Language < ActiveRecord::Base
  attr_accessible :lang, :fluency
  belongs_to :member

end