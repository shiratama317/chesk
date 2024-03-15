class DayTask < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :family

  with_options presence: true do
    validates :action_day
    validates :task_id
    validates :user_id
  end
end
