class Schedule < ApplicationRecord
  belongs_to :family
  belongs_to :user

  validates :event, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end