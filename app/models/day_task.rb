class DayTask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :family

  validates :start_time, presence: true
  validates :completed, inclusion: [true, false]

  attr_accessor :origin
end
