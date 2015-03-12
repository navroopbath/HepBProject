class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :year, :phone, :email, :password, :is_admin, :hours
  has_and_belongs_to_many :event

  def authenticate(pass)
    pass == self.password ? true : false
  end

end