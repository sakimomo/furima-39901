require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it '正しいデータが入力されている場合' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'password456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '重複したemailが存在する場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = existing_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'last-nameは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first-nameは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last-name-kanaは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first-name-kanaは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'パスワードが半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードが半角数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードが全角では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
