class FeedbackRequest < ApplicationRecord
  belongs_to :goal
  belongs_to :requester, class_name: 'User'
  has_and_belongs_to_many :invitees, class_name: 'User'
  has_many :feedbacks
end
