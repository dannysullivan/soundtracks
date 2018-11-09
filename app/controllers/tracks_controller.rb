class TracksController < ApplicationController
  def index
    if params[:tag]
      tag = Tag.find(params[:tag])
      @tracks = tag.tracks
    else
      @tracks = Track.all
    end
  end
end
