class Feedback < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :feedback_request, optional: true
  belongs_to :author, class_name: 'User'
  belongs_to :subject, class_name: 'User'
end
