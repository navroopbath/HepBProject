class Member < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :phone, :grad_date
  validates_format_of :phone, with: /\A[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\z/, message: "must be only digits", allow_blank: true
  validates_format_of :grad_date, with: /\A.+\z/, message: "must be in mm/dd/yy format"
  
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