class Task < ApplicationRecord
  belongs_to :family

  validates :contents, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選択してください"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end