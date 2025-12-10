class AboutController < ApplicationController
  def index
    @artist = Artist.instance
  end
end
