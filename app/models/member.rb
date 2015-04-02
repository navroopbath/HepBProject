class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :grad_date, :phone, :email, :password, :is_admin, :warnings
  has_many :events, :through => :memevents
  has_many :memevents
  has_many :languages

end