class FeedbackRequest < ApplicationRecord
  belongs_to :goal
  belongs_to :requester, class: User
  has_and_belongs_to_many :invitees, class: User
  has_many :feedbacks
end
