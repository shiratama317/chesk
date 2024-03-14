class Task < ApplicationRecord
  belongs_to :family

  validates :contents, presence: true
end