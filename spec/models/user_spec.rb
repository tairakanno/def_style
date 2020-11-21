require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能について' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる時' do
      it 'ユーザー情報が正しく入力できてる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空の時' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが他と被っている時' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空の時' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空のとき' do
        @user.password = 'ttt555'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが違う時' do
        @user.password_confirmation = 'yyy666'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下の時' do
        @user.password = 'ttt55'
        @user.password_confirmation = 'ttt55'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'Genre_idが空の時' do
        @user.genre_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Genre must be other than 1')
      end
      it 'prefecture_idが空' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'imageが空' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
