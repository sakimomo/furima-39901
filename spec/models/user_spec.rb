require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'a', email: '', password: '000000', password_confirmation: '000000', last_name: 'あ', first_name: 'あ',
                      last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'あ',
                      first_name: '', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'あ',
                      first_name: 'あ', last_name_kana: '', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: '', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: 'password123', password_confirmation: 'password456',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以下では登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: '12345', password_confirmation: '12345', last_name: 'あ',
                      first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '重複したemailが存在する場合は登録できない' do
      existing_user = User.create(name: 'existing', email: 'test@example.com', password: 'password123',
                                  password_confirmation: 'password123', last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')

      user = User.new(name: 'a', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      user = User.new(name: 'a', email: 'testexample.com', password: 'password123', password_confirmation: 'password123',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'last-nameは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: 'password123', password_confirmation: 'password123',
                      last_name: 'a', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first-nameは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: 'password123', password_confirmation: 'password123',
                      last_name: 'あ', first_name: 'a', last_name_kana: 'ア', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end

    it 'last-name-kanaは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: 'password123', password_confirmation: 'password123',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'a', first_name_kana: 'ア', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first-name-kanaは全角（漢字・ひらがな・カタカナ）での入力しないと登録できない' do
      user = User.new(name: 'a', email: 'test@example', password: 'password123', password_confirmation: 'password123',
                      last_name: 'あ', first_name: 'あ', last_name_kana: 'ア', first_name_kana: 'a', birthday: '29/11/1998')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
