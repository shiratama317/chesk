class Schedule < ApplicationRecord
  belongs_to :family
  belongs_to :user

  validates :event, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true, comparison: { greater_than_or_equal_to: :start_time, message: "は開始時刻以降で設定してください" }
end