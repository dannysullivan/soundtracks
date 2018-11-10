class Track < ApplicationRecord
  has_many :track_tags
  has_many :tags, through: :track_tags

  def self.with_tags(tags)
    tracks_for_each_tag = tags.map{|tag| tag.tracks}
    tracks_for_each_tag.inject(:&)
  end
end
