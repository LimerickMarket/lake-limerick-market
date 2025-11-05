class SubscriptionsController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    
    if @subscriber.save
      redirect_to root_path, notice: '🎉 Thank you for subscribing! You\'ll receive our newsletter soon.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :weekly_deals, :event_notifications)
  end
end
