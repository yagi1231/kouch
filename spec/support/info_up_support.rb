module InfoUpSupport
  def info_up(info)
    visit new_info_path
    fill_in "info[name]", with: "テスト"
    fill_in "info[address]", with: "埼玉県"
    fill_in "info[telnum]", with: "08000000000"
    fill_in "info[remark]", with: "特になし"
    attach_file "info[image]", "#{Rails.root}/app/assets/images/default.jpg"
    click_on "登録完了する"
    expect(page.accept_confirm).to eq "この情報で登録しますか？"
    expect(page).to have_content 'ユーザー登録が完了しました'
  end
end