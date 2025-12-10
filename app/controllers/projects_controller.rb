class ProjectsController < ApplicationController
  def index
    @projects = Project.published.by_position.includes(cover_image_attachment: :blob)
  end

  def show
    @project = Project.published.find(params[:id])
    @artworks = @project.artworks.by_position.includes(image_attachment: :blob, images_attachments: :blob)
  end
end
