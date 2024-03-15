class CreateDayTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :day_tasks do |t|
      t.date       :action_day, null: false
      t.references :task,       null: false, foreign_key: true
      t.references :user,       null: false, foreign_key: true
      t.references :family,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
