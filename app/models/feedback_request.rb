class FeedbackRequest < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :requester, class_name: 'User'
  has_and_belongs_to_many :invitees, class_name: 'User', join_table: 'feedback_requests_users', foreign_key: :feedback_request_id
  has_many :feedbacks

  def is_pending?(user)
    feedbacks.where(author: user).count == 0
  end

  def pending_requests
    invitees.where.not(id: feedbacks.collect {|feedback| feedback.author.id})
  end

  def completion_percentage
    feedbacks.count / invitees.count
  end
end

