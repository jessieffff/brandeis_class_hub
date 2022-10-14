class ClassPeriod < ApplicationRecord
  belongs_to(
    :course,
    foreign_key: 'course_id' # name of column containing FK
  )
end
