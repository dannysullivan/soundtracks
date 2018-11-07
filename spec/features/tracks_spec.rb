feature 'Tracks' do
  describe 'index' do
    it 'displays links to tracks' do
      FactoryBot.create(:track, title: 'Test Track')
      visit tracks_path
      expect(page).to have_content 'Test Track'
    end
  end
end
