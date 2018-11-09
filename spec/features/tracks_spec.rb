feature 'Tracks' do
  describe 'index' do
    it 'displays links to tracks' do
      FactoryBot.create(:track, title: 'Test Track', bandcamp_track_id: '11111111')
      visit tracks_path
      expect(page).to have_content 'Test Track'
      expect(page).to have_selector('iframe[src="https://bandcamp.com/EmbeddedPlayer/album=2944136907/size=small/bgcol=ffffff/linkcol=0687f5/track=11111111/transparent=true/"]')
    end

    it 'displays tags for tracks' do
      tag1 = FactoryBot.create(:tag, name: 'Happy')
      tag2 = FactoryBot.create(:tag, name: 'Upbeat')

      FactoryBot.create(:track, title: 'Test Track', bandcamp_track_id: '11111111', tags: [tag1, tag2])
      visit tracks_path
      expect(page).to have_content 'Happy'
      expect(page).to have_content 'Upbeat'
    end

    it 'allows user to click tags to filter tracks' do
      happy_tag = FactoryBot.create(:tag, name: 'happy')
      upbeat_tag = FactoryBot.create(:tag, name: 'upbeat')

      FactoryBot.create(:track, title: 'Happy Track', bandcamp_track_id: '11111111', tags: [happy_tag])
      FactoryBot.create(:track, title: 'Upbeat Track', bandcamp_track_id: '11111111', tags: [upbeat_tag])
      visit tracks_path
      expect(page).to have_content 'Happy Track'
      expect(page).to have_content 'Upbeat Track'

      click_on 'happy'
      expect(page).to have_content 'Happy Track'
      expect(page).not_to have_content 'Upbeat Track'
    end
  end
end
