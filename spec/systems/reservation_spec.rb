require 'rails_helper'
RSpec.describe 'Reservationsytems', js: true, type: :system do
    let!(:user) { FactoryBot.create :user }
    let!(:reservation) { FactoryBot.create :reservation }
  
    scenario "アカウントを新規登録テスト" do
      visit "users/sign_up"
      fill_in "user[email]", with: "at.saoo@gmail.com"
      fill_in "user[name]", with: "kouch"
      fill_in "user[password]", with: "a1231t"
      fill_in "user[password_confirmation]", with: "a1231t"
      click_button "登録"
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
    
    scenario 'ログインする' do
      visit "users/sign_in"
      fill_in "user[email]", with: "at.sao@gmail.com"
      fill_in "user[password]", with: "aaaaaa"
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました。'
    end
 
    scenario '左上のロゴの動作確認' do
      visit reservations_path
      click_on "KOUCH"
      expect(current_path).to eq reservations_path
    end

    scenario '新規登録' do
      visit root_path
      click_on "新規注文"
      fill_in "reservation[name]", with: "KOUCH"
      fill_in "reservation[address]", with: "埼玉県"
      fill_in "reservation[telnum]", with: "0900000000"
      fill_in "reservation[time]", with: "2021-10-29"
      fill_in "reservation[backtime]", with: "13:30-14:00"
      fill_in "reservation[order]", with: "ご飯"
      fill_in "reservation[price]", with: "100"
      check "reservation[category]", with: "KOUCH"
      check "reservation[categoryname]", with: "企業"
      fill_in "reservation[remarks]", with: "特になし"
      click_on "登録完了する"
      expect(page.accept_confirm).to eq "この情報で登録しますか？"
      expect(page).to have_content '登録が完了しました'
    end

    scenario "タスク編集" do
      visit "users/sign_in"
      fill_in "user[email]", with: "at.sao@gmail.com"
      fill_in "user[password]", with: "aaaaaa"
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました。'
      click_on "kouch"
      click_on "編集"
      fill_in "reservation[delivery]", with: "青柳樹"
      fill_in "reservation[name]", with: "kouch"
      fill_in "reservation[address]", with: "埼玉県"
      fill_in "reservation[telnum]", with: "0800000000"
      fill_in "reservation[time]", with: "2021-10-30"
      fill_in "reservation[backtime]", with: "13:30-14:00"
      fill_in "reservation[order]", with: "唐揚げ"
      fill_in "reservation[price]", with: "200"
      check "reservation[category]", with: "大戸屋"
      check "reservation[categoryname]", with: "民家"
      fill_in "reservation[remarks]", with: "特になし"
      click_on "登録完了する"
      expect(page.accept_confirm).to eq "この情報で変更しますか？"
      expect(page).to have_content '登録が完了しました'
    end

    scenario "タスク削除" do
      visit "users/sign_in"
      fill_in "user[email]", with: "at.sao@gmail.com"
      fill_in "user[password]", with: "aaaaaa"
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました。'
      click_on "kouch"
      click_on "削除"
      expect(page.accept_confirm).to eq "本当に削除しますか？"
      expect(page).to have_content "情報を削除しました"
    end

    scenario "検索機能テスト" do
      visit root_path
      fill_in 'q[name_or_telnum_or_address_cont]', with: 'kouch'
      click_on "検索"
      expect(page).to have_content 'kouch'
    end

    scenario "トップページへの確認ボタン"do
      visit root_path
      click_on "kouch"
      click_on "予約一覧表に戻る"
      expect(current_path).to eq reservations_path
    end

    scenario "ボタンの確認"do 
      visit root_path
      click_on "新規注文"
      find(".button").click
      expect(page).to have_text("×")
    end

    scenario "ハンバーガーメニュー確認"do
      visit "users/sign_in"
      fill_in "user[email]", with: "at.sao@gmail.com"
      fill_in "user[password]", with: "aaaaaa"
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました。'
      find("#nav-drawer").click
      click_on "お客様情報一覧"
      expect(current_path).to eq infos_path
    end

    scenario "発信テスト"do
      visit root_path
      click_on '0900000000'
    end

    scenario "印刷ページの確認"do
    visit "users/sign_in"
    fill_in "user[email]", with: "at.sao@gmail.com"
    fill_in "user[password]", with: "aaaaaa"
    click_on 'ログイン'
    expect(page).to have_content 'ログインしました。'
    click_on "kouch"
    click_on "領収書の印刷"
    expect(page).to have_css '.print-area'
  end
end