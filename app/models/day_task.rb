class DayTask < ApplicationRecord
  belongs_to :task
  belongs_to :user

  with_options presence: true do
    validates :action_day
    validates :task_id
    validates :user_id
  end
end
