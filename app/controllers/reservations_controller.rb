class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: %i[appDescription]

  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true).page(params[:page]).per(5).order(:time, :backtime)
  end

  def new
    @reservation = Reservation.new(
      name: params[:name],
      address: params[:address],
      telnum: params[:telnum],
      remarks: params[:remark],
      image: params[:image]
    )
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:name, :order, :address, :delivery, :price, :pri,
                                                                       :telnum, :time, :backtime, :remarks, :category, :categoryname, :image))

    if @reservation.save
      flash[:notice] = '登録が完了しました'
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
                                                               :time, :backtime, :remarks, :category, :categoryname, :image))
      flash[:notice] = '登録が完了しました'
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
    @ave_prices = Reservation.where(category: %w[KOUCH コラボ]).order(:time).group(:time).average(:price)
    @sum_prices = Reservation.where(category: %w[KOUCH コラボ]).order(:time).group(:time).sum(:price)
    @sum_price = Reservation.where(category: %w[KOUCH コラボ]).group('YEAR(time)').group('MONTH(time)').sum(:price)
    @ave_price = Reservation.where(category: %w[KOUCH コラボ]).group('YEAR(time)').group('MONTH(time)').average(:price)
  end
end
