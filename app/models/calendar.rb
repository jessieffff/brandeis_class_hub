class Calendar < ApplicationRecord
  has_secure_token :invite_token
  has_many :user_calendars, dependent: :destroy
  has_many :users, through: :user_calendars
  has_many(
    :holidays,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :assignments,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :courses,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )
  has_many(
    :other_events,
    foreign_key: 'calendar_id' # name of column containing FK in other table
  )

  def to_param
    invite_token
  end

  def user?(user)
    users.include?(user)
  end

  # def self.search(search)
  #   if search
  #     # calendar = Calendar.find_by(calendar_name: search)
  #     puts " xxxxxxxxxxxxxxxxxxxxxxxxx"
  #     puts search
  #     @calendars = Calendar.find_by(calendar_name: search)
  #     puts @calendars.calendar_name
  #     # where('calendar_name ilike ?', "%#{search}%")
  #     # find(:all, :conditions => ['calendar_name LIKE ?', "%#{search}%"])
  #     # if calendar
  #     #   where(calendar_name: calendar.calendar_name)
  #     # else
  #     #   @calendars = Calendar.where(user_id: Current.user.id)
  #     # end
  #   else
  #     @calendars = Calendar.where(user_id: Current.user.id)
  #   end
  # end
end
