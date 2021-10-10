class ReservationsController < ApplicationController
  before_action :authenticate_user, { only: %i[edit update destroy] }

  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true).order(:time, :backtime)
  end

  def new
    @reservation = Reservation.new(
      name: params[:name],
      address: params[:address],
      telnum: params[:telnum],
      remarks: params[:remark]
    )
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:name, :order, :address, :delivery, :price,
                                                                       :telnum, :time, :backtime, :remarks, :category, :categoryname))
    if @reservation.save
      redirect_to :reservations
    else
      render 'new'
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
    if @reservation.update(params.require(:reservation).permit(:name, :order, :address, :delivery, :price, :telnum,
                                                               :time, :backtime, :remarks, :category, :categoryname))
      redirect_to :reservations
    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = '情報を削除しました'
    redirect_to :reservations
  end

  def price
    @ave_prices = Reservation.where(category: ['KOUCH','コラボ']).order(:time).group(:time).group(:categoryname).average(:price)
    @sum_prices = Reservation.where(category: ['KOUCH','コラボ']).order(:time).group(:time).group(:categoryname).sum(:price)
    @sum_price = Reservation.where(category: ['KOUCH','コラボ']).group('YEAR(time)').group('MONTH(time)').group(:categoryname).sum(:price)
    @ave_price = Reservation.where(category: ['KOUCH','コラボ']).group('YEAR(time)').group('MONTH(time)').group(:categoryname).average(:price)
  end
end
