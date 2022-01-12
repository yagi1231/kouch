class LikesController < ApplicationController
  before_action :reservation_params
  def create
    Like.create(user_id: current_user.id, reservation_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, reservation_id: params[:id]).destroy
  end

  private

  def reservation_params
    @reservation = Reservation.find(params[:id])
  end
end
