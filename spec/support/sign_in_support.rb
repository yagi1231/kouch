module SignInSupport
  def sign_in(user)
    visit "users/sign_in"
    fill_in "user[email]", with: "at.sao@gmail.com"
    fill_in "user[password]", with: "aaaaaa"
    click_on 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end
end