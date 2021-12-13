module PageUpSupport
    def page_up(reservation)
      # ページ遷移していることを確認する
      expect(current_path).to eq(reservations_path)
    end
  end