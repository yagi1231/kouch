module ReservationUpSupport
    def reservation_up(reservation)
      visit new_reservation_path
      fill_in "reservation[name]", with: "KOUCH"
      fill_in "reservation[address]", with: "埼玉県"
      fill_in "reservation[telnum]", with: "09000000000"
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
  end