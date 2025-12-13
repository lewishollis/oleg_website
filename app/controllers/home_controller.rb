class HomeController < ApplicationController
  def index
    @projects = Project.published.by_position.includes(cover_image_attachment: :blob)

    # Filter artworks by project if a project_id is provided
    if params[:project_id].present?
      @selected_project = Project.find_by(id: params[:project_id])
      @artworks = @selected_project&.artworks&.by_position || []
    else
      # Show all artworks from all published projects
      @artworks = Artwork.joins(:project)
                         .where(projects: { published: true })
                         .includes(:project, image_attachment: :blob)
                         .order("projects.position ASC, artworks.position ASC")
    end
  end
end
