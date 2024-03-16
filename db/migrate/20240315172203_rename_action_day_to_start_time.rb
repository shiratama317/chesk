class RenameActionDayToStartTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :day_tasks, :action_day, :start_time
  end
end
