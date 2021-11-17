require 'rails_helper'

RSpec.describe "Reservationmodel", type: :model do 

   it "名前、住所、電話、日付、時間、注文、金額、カテゴリー、企業or民家、備考がある場合有効" do
    reservation = FactoryBot.build(:reservation)
    expect(reservation).to be_valid
   end

   it "名前がない場合無効" do
   reservation = FactoryBot.build(:reservation, name: nil)
   reservation.valid?
   expect(reservation.errors[:name]).to include("を入力してください")
   end

   it "住所がない場合無効" do
   reservation = FactoryBot.build(:reservation, address: nil)
   reservation.valid?
   expect(reservation.errors[:address]).to include("を入力してください")
   end

   it "電話がない場合無効" do
   reservation = FactoryBot.build(:reservation, telnum: nil)
   reservation.valid?
   expect(reservation.errors[:telnum]).to include("を入力してください")
   end

   it "日付がない場合無効" do
   reservation = FactoryBot.build(:reservation, time: nil)
   reservation.valid?
   expect(reservation.errors[:time]).to include("を入力してください")
   end

   it "時間がない場合無効" do
   reservation = FactoryBot.build(:reservation, backtime: nil)
   reservation.valid?
   expect(reservation.errors[:backtime]).to include("を入力してください")
   end

   it "金額がない場合無効" do
   reservation = FactoryBot.build(:reservation, price: nil)
   reservation.valid?
   expect(reservation.errors[:price]).to include("を入力してください")
   end

   it "カテゴリーがない場合無効" do
   reservation = FactoryBot.build(:reservation, category: nil)
   reservation.valid?
   expect(reservation.errors[:category]).to include("を入力してください")
   end

   it "企業or民家がない場合無効" do
   reservation = FactoryBot.build(:reservation, categoryname: nil)
   reservation.valid?
   expect(reservation.errors[:categoryname]).to include("を入力してください")
   end   
end