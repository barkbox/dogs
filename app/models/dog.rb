class Dog < ApplicationRecord
  acts_as_paranoid
  validates :bark_user_id, presence: true
end
