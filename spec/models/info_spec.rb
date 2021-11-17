require 'rails_helper'

RSpec.describe "Infomodel", type: :model do 

   it "名前、住所、電話、がある場合有効" do
    info = FactoryBot.build(:info)
    expect(info).to be_valid
   end

   it "名前がない場合無効" do
   info = FactoryBot.build(:info, name: nil)
   info.valid?
   expect(info.errors[:name]).to include("を入力してください")
   end

   it "住所がない場合無効" do
   info = FactoryBot.build(:info, address: nil)
   info.valid?
   expect(info.errors[:address]).to include("を入力してください")
   end
   
   it "電話がない場合無効" do
   info = FactoryBot.build(:info, telnum: nil)
   info.valid?
   expect(info.errors[:telnum]).to include("を入力してください")
   end
end