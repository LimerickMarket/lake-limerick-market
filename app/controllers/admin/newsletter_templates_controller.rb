class Admin::NewsletterTemplatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_template, only: [:show, :edit, :update, :destroy, :preview, :send_now]

  def index
    @templates = NewsletterTemplate.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @template = NewsletterTemplate.new
  end

  def create
    @template = NewsletterTemplate.new(template_params)
    
    if @template.save
      redirect_to admin_newsletter_templates_path, notice: 'Newsletter template was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @template.update(template_params)
      redirect_to admin_newsletter_templates_path, notice: 'Newsletter template was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @template.destroy
    redirect_to admin_newsletter_templates_path, notice: 'Newsletter template was successfully deleted.'
  end
  
  def preview
    # This will render a preview of the newsletter
    render layout: false
  end
  
  def send_now
    # Get subscribers based on template type
    subscribers = case @template.template_type
    when 'weekly_deals'
      Subscriber.where(weekly_deals: true)
    when 'event_notifications'
      Subscriber.where(event_notifications: true)
    else
      Subscriber.none
    end
    
    if subscribers.any?
      # Send emails to all subscribers
      subscribers.each do |subscriber|
        NewsletterMailer.send_newsletter(@template, subscriber).deliver_later
      end
      
      @template.update(last_sent_at: Time.current)
      redirect_to admin_newsletter_templates_path, notice: "Newsletter sent to #{subscribers.count} subscriber(s)!"
    else
      redirect_to admin_newsletter_templates_path, alert: 'No subscribers found for this template type.'
    end
  end

  private

  def set_template
    @template = NewsletterTemplate.find(params[:id])
  end

  def template_params
    params.require(:newsletter_template).permit(:name, :template_type, :subject, :body, :cadence, :active)
  end
end
