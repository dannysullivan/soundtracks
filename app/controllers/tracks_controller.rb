class TracksController < ApplicationController
  def index
    if params[:selected_tags].present?
      tags = Tag.find(params[:selected_tags].split(','))
      @tracks = Track.with_tags(tags)
      @selected_tags = tags
    else
      @selected_tags = []
      @tracks = Track.all
    end
  end
end
