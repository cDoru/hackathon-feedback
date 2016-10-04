class Goal < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :feedback_requests
  has_many :feedbacks
end
