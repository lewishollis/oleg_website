class ContactsController < ApplicationController
  def new
    @contact_inquiry = ContactInquiry.new
    # Get a random artwork with an image for the featured section
    @featured_artwork = Artwork.joins(:project)
                                .where(projects: { published: true })
                                .joins(image_attachment: :blob)
                                .order("RANDOM()")
                                .first
  end

  def create
    @contact_inquiry = ContactInquiry.new(contact_inquiry_params)

    if @contact_inquiry.save
      redirect_to root_path, notice: "Thank you for your message. I'll get back to you within 2-3 business days!"
    else
      @featured_artwork = Artwork.joins(:project)
                                  .where(projects: { published: true })
                                  .joins(image_attachment: :blob)
                                  .order("RANDOM()")
                                  .first
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_inquiry_params
    params.require(:contact_inquiry).permit(:name, :email, :message)
  end
end
