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

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_hours
    total = 0
    memevents.each do |memevent|
      if memevent.approved
        total += memevent.hours
      end
    end
    total
  end

  def num_current_events
    total = 0
    memevents.each do |memevent|
      Time.now > Settings.deadline_one ? current_deadline = Settings.deadline_two : current_deadline = Settings.deadline_one
      this_semester = Settings.semester_start_date.to_date < memevent.event.date.to_date && memevent.event.date.to_date < current_deadline.to_date
      if this_semester && memevent.approved && !memevent.waitlisted
        total += 1
      end
    end
    total
  end

end