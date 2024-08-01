class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('subscription_form', partial: 'subscription_success') }
        format.html { redirect_to root_path, notice: 'Subscribed successfully.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :create }
        format.html { render :new }
      end
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
