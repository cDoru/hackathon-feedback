class CreateNotificationSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_subscriptions do |t|
      t.string :endpoint
      t.string :auth_key
      t.string :p256dh_key
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
