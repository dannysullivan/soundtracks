class CreateTrackTags < ActiveRecord::Migration[5.0]
  def change
    create_table :track_tags do |t|
      t.integer :track_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
