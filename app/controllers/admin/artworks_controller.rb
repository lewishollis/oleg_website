class Admin::ArtworksController < Admin::BaseController
  before_action :set_artwork, only: [ :edit, :update, :destroy ]

  def index
    @artworks = Artwork.includes(:project).by_position
  end

  def new
    @artwork = Artwork.new
    @projects = Project.all
  end

  def create
    @artwork = Artwork.new(artwork_params)
    assign_project_from_name if params[:project_name].present?

    if @artwork.save
      redirect_to admin_artworks_path, notice: "Artwork created successfully."
    else
      @projects = Project.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @projects = Project.all
  end

  def update
    assign_project_from_name if params[:project_name].present?

    if @artwork.update(artwork_params)
      redirect_to admin_artworks_path, notice: "Artwork updated successfully."
    else
      @projects = Project.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork.destroy
    redirect_to admin_artworks_path, notice: "Artwork deleted successfully."
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :medium, :dimensions, :year, :position, :project_id, :image, images: [])
  end

  def assign_project_from_name
    project = Project.find_or_create_by(title: params[:project_name].strip) do |p|
      p.published = true
    end
    @artwork.project = project
  end
end
