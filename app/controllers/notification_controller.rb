class NotificationController < ApplicationController
  def subscribe
    subscription_params = params.fetch(:subscription, {})

    subscription = NotificationSubscription.find_or_create_by!(endpoint: subscription_params[:endpoint], user: current_user)
    subscription.auth_key = subscription_params[:keys][:auth]
    subscription.p256dh_key = subscription_params[:keys][:p256dh]
    subscription.save!

    head :ok
  end

  def unsubscribe
  end
end
