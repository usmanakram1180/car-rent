class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path, notice: 'Message sent successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :phone, :project, :subject, :message)
  end
end
