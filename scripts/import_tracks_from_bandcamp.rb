require 'CSV'

CSV.foreach('tmp/tracks.csv', headers: true) do |line|
  Track.find_or_create_by(title: line[0], bandcamp_track_id: line[1])
end
