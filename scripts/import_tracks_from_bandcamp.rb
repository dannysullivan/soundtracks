require 'CSV'

CSV.foreach('tmp/tracks.csv', headers: true) do |line|
  track = Track.find_or_create_by(title: line[0], bandcamp_track_id: line[1])
  line[2].split(', ').each do |tag_name|
    tag = Tag.find_or_create_by(name: tag_name)
    track.update_attributes(tags: (track.tags + [tag]).uniq)
  end
end
