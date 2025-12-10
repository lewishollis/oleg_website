class HomeController < ApplicationController
  def index
    @projects = Project.published.by_position.includes(cover_image_attachment: :blob)
  end
end
