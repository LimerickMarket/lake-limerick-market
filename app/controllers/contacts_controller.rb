class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      # Send notification email to admin
      ContactMailer.new_contact(@contact).deliver_later
      
      redirect_to root_path, notice: "Thank you for contacting us! We'll get back to you soon."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
