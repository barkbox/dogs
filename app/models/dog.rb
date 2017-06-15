class Dog < ApplicationRecord
  acts_as_paranoid
  validates :user_id, presence: true
end
