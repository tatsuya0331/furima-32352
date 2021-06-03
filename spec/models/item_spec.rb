require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context "商品出品できる" do
      it "商品画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と価格があれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品出品できないとき" do
      it "画像が空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it "商品名が空では出品できない" do
        @item.product_name = " "
        @item.valid?
        expect(@item.errors.full_messages).to include ("Product name can't be blank")
      end
      it "商品の説明が空では出品できない" do
        @item.description = " "
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it "カテゴリーが1では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it "商品の状態が1では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status must be other than 1")
      end
      it "配送料の負担が1では出品できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden must be other than 1")
      end
      it "発送元の地域が1では出品できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery must be other than 1")
      end
      it "発送までの日数が1では出品できない" do
        @item.days_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Days delivery must be other than 1")
      end
      it "価格が空では出品できない" do
        @item.price = " "
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "ユーザーが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end
      it "商品名が41文字以上では出品できない" do
        @item.product_name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include ("Product name is too long (maximum is 40 characters)")
      end
      it "商品の説明が1001文字以上では出品できない" do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description is too long (maximum is 1000 characters)")
      end
      it "価格は半角数字でないと出品できない" do
        @item.price = "a"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it "価格が299以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it "価格が10000000以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
      it "商品価格が半角英数字混合では出品できない" do
        @item.price = "aa11"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it "商品価格が全角文字では出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
  end
end
end