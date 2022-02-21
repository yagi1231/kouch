require 'rails_helper'
RSpec.describe 'Infosystems', js: true, type: :system do
  let!(:user) { FactoryBot.create :user }
  let!(:info) { FactoryBot.create :info }

  scenario "顧客新規登録" do
    sign_in(user)
    visit infos_path
    click_on "新規登録"
    fill_in "info[name]", with: "テスト"
    fill_in "info[address]", with: "埼玉県"
    fill_in "info[telnum]", with: "08000000000"
    fill_in "info[remark]", with: "特になし"
    attach_file "info[image]", "#{Rails.root}/app/assets/images/default.jpg"
    click_on "登録完了する"
    expect(page.accept_confirm).to eq "この情報で登録しますか？"
    expect(page).to have_content 'ユーザー登録が完了しました'
  end

  scenario "顧客情報編集" do
    sign_in(user)
    visit infos_path
    click_on "kouch"
    click_on "編集"
    fill_in "info[name]", with: "kouch"
    fill_in "info[address]", with: "埼玉県"
    fill_in "info[telnum]", with: "08000000000"
    fill_in "info[remark]", with: "特になし"
    attach_file "info[image]", "#{Rails.root}/app/assets/images/backimages.jpeg"
    click_on "登録完了する"
    expect(page.accept_confirm).to eq "この情報で変更しますか？"
    expect(page).to have_content 'ユーザー編集が完了しました'
  end

  scenario "削除"do
    sign_in(user)
    visit infos_path
    click_on "kouch"
    click_on "削除"
    expect(page.accept_confirm).to eq "本当に削除しますか？"
    expect(page).to have_content "情報を削除しました"
  end

  scenario "トップページへの確認ボタン"do
    sign_in(user)
    visit infos_path
    click_on "kouch"
    click_on "お客様情報一覧に戻る"
    expect(current_path).to eq infos_path
  end

  scenario "検索機能テスト" do
    sign_in(user)
    visit infos_path
    fill_in 'q[name_or_telnum_or_address_cont]', with: 'kouch'
    click_on "検索"
    expect(page).to have_content 'kouch'
  end

  scenario "顧客情報をreservationに送る"do
    sign_in(user)
    visit infos_path
    click_on "kouch"
    click_on "新規注文画面へ"
    fill_in "reservation[time]", with: "2021-10-29"
    fill_in "reservation[backtime]", with: "13:30-14:00"
    fill_in "reservation[order]", with: "ご飯"
    fill_in "reservation[price]", with: "100"
    check "reservation[category]", with: "KOUCH"
    check "reservation[categoryname]", with: "企業"
    click_on "登録完了する"
    expect(page.accept_confirm).to eq "この情報で登録しますか？"
    expect(page).to have_content '登録が完了しました'
  end
 
  scenario "ペーネーションの確認"do
    sign_in(user)
    info_up(info)
    info_up(info)
    info_up(info)
    info_up(info)
    info_up(info)
    info_up(info)
    visit infos_path
    expect{ find_link('2', rel="next").click }
    page_u(info)
    expect{ find_link('1', rel="prev").click }
    page_u(info)
    expect{ find_link('Last', ".page-link").click }
    page_u(info)
    expect{ find_link('First', ".page-link").click }
    page_u(info)
  end
end