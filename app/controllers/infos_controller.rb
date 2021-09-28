class InfosController < ApplicationController
  before_action :authenticate_user, {only: [:index, :new, :show, :edit, :update]}

  def index 
    @q = Info.ransack(params[:q])
    @infos = @q.result(distinct: true).order(name: "DESC")  
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(params.require(:info).permit(:name, :address, :telnum, :remark))
      if @info.save
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/infos/#{@info.id}")
      else
        render ("infos/new")
      end
  end
    
  def show
    @info = Info.find(params[:id])
    @user = @info.user
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    if @info.update(params.require(:info).permit(:name, :address, :telnum, :remark))
       redirect_to :infos
    else
        render ("/infos/edit")
    end
  end

  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    flash[:notice] = "情報を削除しました"
    redirect_to :infos
  end
end
