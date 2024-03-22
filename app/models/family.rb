class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :tasks, dependent: :destroy
  has_many :day_tasks, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
end
