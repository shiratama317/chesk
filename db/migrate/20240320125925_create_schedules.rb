class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string     :event,      null: false
      t.datetime   :start_time, null: false
      t.datetime   :end_time,   null: false
      t.references :family,     null: false, foreign_key: true
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
