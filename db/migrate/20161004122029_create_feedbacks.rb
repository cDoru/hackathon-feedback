class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :description
      t.integer :rating
      t.belongs_to :goal, index: true
      t.belongs_to :feedback_request, index: true
      t.belongs_to :author, index: true
      t.belongs_to :subject, index: true
      t.timestamps
    end
  end
end
