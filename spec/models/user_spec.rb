require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
  context '新規登録できるとき' do
    it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kanaとbirthbayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it "nicknameが空では登録できない" do
      @user.nickname = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
    end
    it "First_name_kanaが空では登録できない" do
      @user.first_name_kana = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = " "
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include ("Email has already been taken")
    end
    it "メールアドレスは、@がないと登録できないこと" do
      @user.email = "aaa111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合でないと登録できない" do
      @user.password = "000aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが半角英字のみの時は登録できないこと" do
      @user.password = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードが半角数字のみの時は登録できないこと" do
      @user.password = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない" do
      @user.last_name ="abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない" do
      @user.first_name ="def"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_name_kanaのフリガナは、全角（カタカナ）でないと登録できない" do
      @user.last_name_kana = "えーびーしー"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "first_name_kanaのフリガナは、全角（カタカナ）でないと登録できない" do
      @user.first_name_kana = "でぃーいーえふ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")  
    end
  end
  end
end