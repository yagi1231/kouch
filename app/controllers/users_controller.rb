class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

  def index
    @users = User.all
  end
  def new 
    @user = User.new
  end
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
   if @user.save
    session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/reservations")
    else
      render("users/new")
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit 
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name,:address,:telnum, :remark))
      redirect_to :users
    else
      render ("users/edit")
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]="スケジュールを削除しました"
    redirect_to :users
  end
  
  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      # 変数sessionに、ログインに成功したユーザーのidを代入してください
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/reservations")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
