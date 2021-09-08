class ReservationsController < ApplicationController
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  
  def index
    @reservations = Reservation.all.order(:time,:backtime)
    @infos = Info.all
    if params[:name].present?
      @reservations = @reservations.get_by_name params[:name]
    end
  end

  def new
    @reservation = Reservation.new(
      name: params[:name] ,
      address: params[:address],
      telnum: params[:telnum],
      remarks: params[:remark],
    )
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:name,:order, :address, :delivery, :price, :telnum, :time, :remarks))
    if @reservation.save
      redirect_to :reservations
    else
      render "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit 
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:name,:order, :address, :delivery, :price, :telnum, :time, :remarks))
      redirect_to :reservations
    else
      render "edit"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "情報を削除しました"
    redirect_to :reservations
  end
end
