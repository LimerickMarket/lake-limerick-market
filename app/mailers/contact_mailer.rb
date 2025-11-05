class ContactMailer < ApplicationMailer
  default from: 'noreply@limerickmarket.com'
  default to: 'limerick_market@yahoo.com'

  def new_contact(contact)
    @contact = contact
    
    mail(
      subject: "New Contact Form Submission from #{contact.name}",
      reply_to: contact.email
    )
  end
end
