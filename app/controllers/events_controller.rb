class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @events = Event.upcoming.page(params[:page]).per(8)
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
