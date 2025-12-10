class ContactsController < ApplicationController
  def new
    @contact_inquiry = ContactInquiry.new
  end

  def create
    @contact_inquiry = ContactInquiry.new(contact_inquiry_params)

    if @contact_inquiry.save
      redirect_to root_path, notice: "Thank you for your message. We'll get back to you soon!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_inquiry_params
    params.require(:contact_inquiry).permit(:name, :email, :subject, :message)
  end
end
