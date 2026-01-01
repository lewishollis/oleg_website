class ProjectsController < ApplicationController
  def index
    @projects = if params[:project_id].present?
      Project.published.where(id: params[:project_id]).by_position.includes(cover_image_attachment: :blob)
    else
      Project.published.by_position.includes(cover_image_attachment: :blob)
    end
  end

  def show
    @project = Project.published.find(params[:id])
    @artworks = @project.artworks.by_position.includes(image_attachment: :blob, images_attachments: :blob)
  end
end
