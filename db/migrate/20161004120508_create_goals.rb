class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.belongs_to :owner, index:true
      t.timestamps
    end
  end
end
