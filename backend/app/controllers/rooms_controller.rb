class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  def index
    @rooms = Room.all
    render json: @rooms
  end

  def show
    render json: @room
  end

  private 
  def set_room
		@room = Room.find(params[:id])
  end
end
