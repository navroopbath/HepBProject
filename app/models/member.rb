class Member < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone, :grad_date
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :phone, :grad_date, :is_admin, :warnings
  has_many :events, :through => :memevents
  has_many :memevents
  has_many :languages
end