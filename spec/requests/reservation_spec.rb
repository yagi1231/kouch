require 'rails_helper'

RSpec.describe "Reservationrequest", type: :request do
  let!(:reservation) { FactoryBot.create :reservation }

  before do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get reservations_path
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do 
      get reservations_path
      expect(response.body).to include "kouch"
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      get reservation_url 1
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get reservation_url 1
      expect(response.body).to include 'kouch'
    end

    context 'ユーザーが存在しない場合' do
      subject { -> { get reservation_url 2 } }
      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'GET #new'do
    it 'リクエストが成功すること' do
      get new_reservation_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit'do
    it 'リクエストが成功すること' do
      get edit_reservation_path 1
      expect(response.status).to eq 200
    end

    it 'nameが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include 'kouch'
    end

    it 'addressが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '埼玉県'
    end

    it 'telnumが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '0900000000'
    end

    it 'timeが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include {Date.today}
    end

    it 'backtimeが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '13:30-14:00'
    end

    it 'orderが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include 'ご飯'
    end

    it 'priceが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '100'
    end

    it 'categoryが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include 'KOUCH'
    end

    it 'categorynameが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '企業'
    end

    it 'remarksが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '特になし'
    end

    it 'deliveryが表示されていること' do
      get edit_reservation_path 1
      expect(response.body).to include '青柳樹'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation) }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do
          post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation) }
        end.to change(Reservation, :count).by(1)
      end

      it 'リダイレクトすること' do
        post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation) }
        expect(response).to redirect_to "/reservations"
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid) }
        expect(response.status).to eq 200
      end

      it 'ユーザーが登録されないこと' do
        expect do
          post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid) }
        end.to_not change(Reservation, :count)
      end

      it 'エラーが表示されること' do
        post reservations_url, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid) }
        expect(response.body).to include '名前を入力してください'
      end
    end
  end

  describe 'PUT #update' do
    let(:takashi) { FactoryBot.create :takashi }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:satoshi) }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
          put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:satoshi) }
        end.to change { Reservation.find(takashi.id).name }.from('Takashi').to('Satoshi')
      end

      it 'リダイレクトすること' do
        put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:satoshi) }
        expect(response).to redirect_to "/reservations"
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid)}
        expect(response.status).to eq 200
      end

      it 'ユーザー名が変更されないこと' do
        expect do
          put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid)}
        end.to_not change(Reservation.find(takashi.id), :name)
      end

      it 'エラーが表示されること' do
        put reservation_url takashi, params: { reservation: FactoryBot.attributes_for(:reservation, :invalid)}
        expect(response.body).to include '名前を入力してください'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'リクエストが成功すること' do
      delete reservation_url reservation
      expect(response.status).to eq 302
    end

    it 'ユーザーが削除されること' do
      expect do
        delete reservation_url reservation
      end.to change(Reservation, :count).by(-1)
    end

    it 'ユーザー一覧にリダイレクトすること' do
      delete reservation_url reservation
      expect(response).to redirect_to(reservations_url)
    end
  end

  describe 'GET #price' do
    it 'リクエストが成功すること' do
      get price_reservations_path
      expect(response.status).to eq 200
    end
  end
end