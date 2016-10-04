class CreateFeedbackRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :feedback_requests do |t|
      t.string :title
      t.text :description
      t.belongs_to :goal, index: true
      t.belongs_to :requester, null: false, index: true
      t.timestamps
    end
  end
end
