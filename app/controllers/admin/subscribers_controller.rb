class Admin::SubscribersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  def index
    @subscribers = Subscriber.all.order(subscribed_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @subscriber.update(subscriber_params)
      redirect_to admin_subscribers_path, notice: 'Subscriber was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscriber.destroy
    redirect_to admin_subscribers_path, notice: 'Subscriber was successfully deleted.'
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find(params[:id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email, :weekly_deals, :event_notifications)
  end
end
