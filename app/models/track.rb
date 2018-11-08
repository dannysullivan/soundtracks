class Track < ApplicationRecord
  has_many :track_tags
  has_many :tags, through: :track_tags
end
