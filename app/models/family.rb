class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users

  validates :name, presence: true, length: { maximum: 15 }
end
