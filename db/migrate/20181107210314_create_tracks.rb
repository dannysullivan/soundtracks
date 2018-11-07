class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :bandcamp_url
      t.timestamps
    end
  end
end
