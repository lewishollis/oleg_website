class Admin::DashboardController < Admin::BaseController
  def index
    @projects_count = Project.count
    @artworks_count = Artwork.count
    @unread_inquiries_count = ContactInquiry.unread.count
    @recent_inquiries = ContactInquiry.recent.limit(5)
  end
end
