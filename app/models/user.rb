class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 8 }
  validates :password, presence: true, on: :create

  has_many :family_users, dependent: :destroy
  has_many :families, through: :family_users
  has_many :day_tasks, dependent: :destroy

  attr_accessor :family_id
end
