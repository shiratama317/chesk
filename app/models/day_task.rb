class DayTask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :family

  validates :start_time, presence: true
end
