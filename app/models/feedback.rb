class Feedback < ApplicationRecord
  belongs_to :goal, optional: true
  belongs_to :feedback_request, optional: true
  belongs_to :author, class_name: 'User'
  belongs_to :subject, class_name: 'User'

  def type
    if feedback_request and goal
      return "Requested Goal feedback"
    end

    if feedback_request
      return "Requested feedback"
    end

    if goal
      return "Goal feedback"
    end

    return "Unsolicited feedback"
  end
end
