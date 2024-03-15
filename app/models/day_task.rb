class DayTask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :family

  validates :action_day, presence: true
end
