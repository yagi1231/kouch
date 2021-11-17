require 'rails_helper'

RSpec.describe "Inforequest", type: :request do
  let!(:info) { FactoryBot.create :info }

  before do 
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get infos_path
      expect(response.status).to eq 200
    end
    
    it 'ユーザー名が表示されていること' do 
      get infos_path
      expect(response.body).to include "kouch"
    end
  end

  describe 'GET #show' do
    it 'リクエストが成功すること' do
      get info_url 1
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get info_url 1
      expect(response.body).to include 'kouch'
    end

    context 'ユーザーが存在しない場合' do
      subject { -> { get info_url 2 } }
      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'GET #new'do
    it 'リクエストが成功すること' do
      get new_info_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit'do
    it 'リクエストが成功すること' do
      get edit_info_path 1
      expect(response.status).to eq 200
    end
    it 'nameが表示されていること' do
      get edit_info_path 1
      expect(response.body).to include 'kouch'
    end
    it 'addressが表示されていること' do
      get edit_info_path 1
      expect(response.body).to include '埼玉県'
    end
    it 'telnumが表示されていること' do
      get edit_info_path 1
      expect(response.body).to include '0900000000'
    end
    it 'remarkが表示されていること' do
      get edit_info_path 1
      expect(response.body).to include '特になし'
    end
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post infos_url, params: { info: FactoryBot.attributes_for(:info) }
        expect(response.status).to eq 302
      end
      it 'ユーザーが登録されること' do
        expect do
          post infos_url, params: { info: FactoryBot.attributes_for(:info) }
        end.to change(Info, :count).by(1)
      end
      it 'リダイレクトすること' do
        post infos_url, params: { info: FactoryBot.attributes_for(:info) }
        expect(response).to redirect_to "/infos/2"
      end
    end
    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post infos_url, params: { info: FactoryBot.attributes_for(:info, :invalid) }
        expect(response.status).to eq 200
      end
      it 'ユーザーが登録されないこと' do
        expect do
          post infos_url, params: { info: FactoryBot.attributes_for(:info, :invalid) }
        end.to_not change(Info, :count)
      end
      it 'エラーが表示されること' do
        post infos_url, params: { info: FactoryBot.attributes_for(:info, :invalid) }
        expect(response.body).to include 'Nameを入力してください'
      end
    end
  end

  describe 'PUT #update' do
    let(:ootoya) { FactoryBot.create :ootoya }

    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put info_url ootoya, params: { info: FactoryBot.attributes_for(:kouch) }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
          put info_url ootoya, params: { info: FactoryBot.attributes_for(:kouch) }
        end.to change { Info.find(ootoya.id).name }.from('Ootoya').to('Kouch')
      end

      it 'リダイレクトすること' do
        put info_url ootoya, params: { info: FactoryBot.attributes_for(:kouch) }
        expect(response).to redirect_to "/infos"
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        put info_url ootoya, params: { info: FactoryBot.attributes_for(:info, :invalid)}
        expect(response.status).to eq 200
      end

      it 'ユーザー名が変更されないこと' do
        expect do
          put info_url ootoya, params: { info: FactoryBot.attributes_for(:info, :invalid)}
        end.to_not change(Info.find(ootoya.id), :name)
      end

      it 'エラーが表示されること' do
        put info_url ootoya, params: { info: FactoryBot.attributes_for(:info, :invalid)}
        expect(response.body).to include 'Nameを入力してください'
      end
    end
  end
   
  describe 'DELETE #destroy' do
    it 'リクエストが成功すること' do
      delete info_url info
      expect(response.status).to eq 302
    end

    it 'ユーザーが削除されること' do
      expect do
        delete info_url info
      end.to change(Info, :count).by(-1)
    end

    it 'ユーザー一覧にリダイレクトすること' do
      delete info_url info
      expect(response).to redirect_to(infos_url)
    end
  end
end