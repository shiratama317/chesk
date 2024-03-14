class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
end
