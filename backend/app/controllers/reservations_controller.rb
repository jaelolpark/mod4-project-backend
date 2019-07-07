class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :update]
  def index
    @reservations = Reservation.all
    render json: @reservation
  end

  def show
    render json: @reservation
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: {reservation: @reservation}, status: :created
    else
      render json: {errors: @reservation.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    unless @reservation.nil?
      @reservation.destroy
      render json: @reservation
    else
      render json: { error: "Reservation not Found!" }, status: 404
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :updated
    else  
      render json: @reservation.errors.full_messages, status: :unprocessable_entity
    end
  end

  private 
  def set_reservation
		@reservation = Reservation.find(params[:id])
	end

  def reservation_params
		params.require(:reservation).permit(:user_id, :room_id)
	end
end