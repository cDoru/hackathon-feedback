class FeedbackRequestUser < ActiveRecord::Migration[5.0]
  def change
    create_table :feedback_requests_users, id:false do |t|
      t.belongs_to :feedback_request, index:true
      t.belongs_to :user, index:true
    end
  end
end
