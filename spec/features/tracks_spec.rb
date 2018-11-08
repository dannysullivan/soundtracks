feature 'Tracks' do
  describe 'index' do
    it 'displays links to tracks' do
      FactoryBot.create(:track, title: 'Test Track', bandcamp_track_id: '11111111')
      visit tracks_path
      expect(page).to have_content 'Test Track'
      expect(page).to have_selector('iframe[src="https://bandcamp.com/EmbeddedPlayer/album=2944136907/size=small/bgcol=ffffff/linkcol=0687f5/track=11111111/transparent=true/"]')
    end
  end
end
