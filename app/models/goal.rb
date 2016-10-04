class Goal < ApplicationRecord
  belongs_to :owner, class: User
  has_many :feedback_requests
  has_many :feedbacks
end
