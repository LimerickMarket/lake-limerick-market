class NewsletterMailer < ApplicationMailer
  default from: 'noreply@limerickmarket.com'

  def send_newsletter(subscriber, template)
    @subscriber = subscriber
    @template = template
    @menu_items = MenuItem.where(available: true).order(:name)
    @events = Event.where('event_date >= ?', Date.today).order(:event_date).limit(5)
    @promos = Promo.where(active: true).order(created_at: :desc).limit(3)
    
    mail(
      to: subscriber.email,
      subject: template.subject
    ) do |format|
      format.html { render html: template.body_html.html_safe }
      format.text { render plain: template.body_text }
    end
  end
end
