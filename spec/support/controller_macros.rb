module SignInRequestModule
  def sign_in_request_as(user)
    session_params = { session: { email: user.email, password: user.password } }
    post "/login", params: session_params
  end
end