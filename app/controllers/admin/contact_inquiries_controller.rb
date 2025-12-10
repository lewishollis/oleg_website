class Admin::ContactInquiriesController < Admin::BaseController
  before_action :set_inquiry, only: [ :show ]

  def index
    @inquiries = ContactInquiry.recent
  end

  def show
    @inquiry.update(read: true) unless @inquiry.read?
  end

  private

  def set_inquiry
    @inquiry = ContactInquiry.find(params[:id])
  end
end
