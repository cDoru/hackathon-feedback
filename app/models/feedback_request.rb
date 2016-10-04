class FeedbackRequest < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :requester, class_name: 'User'
  has_and_belongs_to_many :invitees, class_name: 'User', join_table: 'feedback_requests_users', foreign_key: :user_id
  has_many :feedbacks
end
