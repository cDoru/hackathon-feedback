class Feedback < ApplicationRecord
  belongs_to :goal
  belongs_to :feedback_request
  belongs_to :author, class_name: 'User'
  belongs_to :subject, class_name: 'User'
end
