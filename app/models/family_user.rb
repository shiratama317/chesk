class FamilyUser < ApplicationRecord
  belongs_to :family
  belongs_to :user
end
