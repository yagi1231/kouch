require 'rails_helper'

RSpec.describe "modelテスト", type: :model do 

   it "名前、メールアドレス、パスワードがある場合有効" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
   end

   it "名前がない場合無効" do
   user = FactoryBot.build(:user, name: nil)
   user.valid?
   expect(user.errors[:name]).to include("を入力してください")
   end

   it "メールアドレスがない場合無効" do
   user = FactoryBot.build(:user, email: nil)
   user.valid?
   expect(user.errors[:email]).to include("を入力してください")
   end
   
   it "パスワードがない場合無効" do
   user = FactoryBot.build(:user, password: nil)
   user.valid?
   expect(user.errors[:password]).to include("を入力してください")
   end
end