class Dog < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  validates :bark_user_id, presence: true
end
