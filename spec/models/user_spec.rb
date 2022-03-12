require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '全ての値が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'ニックネーム:必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'メールアドレス:必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      
      it '＠を含まないメールアドレスは登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワード:必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it 'パスワードが5文字以下では登録できない' do
        @user.password = '0000'
        @user.password_confirmation = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１２３ＡＢｃ'
        @user.password_confirmation = '１２３ＡＢｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '都道府県を選択していないと保存できないこと' do
        @user.prefecture_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture を入力してください")
      end
      it '市区町村が空だと保存できないこと' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("City can't be blank")
      end
    end
  end
end
