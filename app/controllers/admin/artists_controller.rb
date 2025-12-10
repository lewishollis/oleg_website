class Admin::ArtistsController < Admin::BaseController
  def edit
    @artist = Artist.instance
  end

  def update
    @artist = Artist.instance
    if @artist.update(artist_params)
      redirect_to edit_admin_artist_path, notice: "Artist information updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :profile_image)
  end
end
