require 'rails_helper'

RSpec.describe Opus, type: :model do
  describe '作品投稿機能について' do
    before do
      @opus = FactoryBot.build(:opus)
    end
    context 'できる時' do
      it '全部の情報が入力できている' do
        expect(@opus).to be_valid
      end
      it 'imageが空でもyoutube_urlが存在する' do
        @opus.image = nil
        @opus.youtube_url = "lhXoFuJnMQ4"
        expect(@opus).to be_valid
      end
    end

    context '新規投稿できない時' do
      it 'titleが空' do
        @opus.title = ''
        @opus.valid?
        expect(@opus.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptioneが空' do
        @opus.description = ''
        @opus.valid?
        expect(@opus.errors.full_messages).to include("Description can't be blank")
      end
      it 'image,youtube_urlどちらも空' do
        @opus.image = nil
        @opus.valid?
        expect(@opus.errors.full_messages).to include("Video or image can't be blank")
      end
      it 'userと紐づいていないといけない' do
        @opus.user = nil
        @opus.valid?
        expect(@opus.errors.full_messages).to include('User must exist')
      end
    end  
  end
end
