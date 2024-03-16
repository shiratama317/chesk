class AddCompletedToDayTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :day_tasks, :completed, :boolean, null: false, default: false
  end
end
