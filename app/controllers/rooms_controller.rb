class RoomsController < ApplicationController

  def new
    # params.permit(:room_img, :room_name, :room_detail, :fee, :address)
    @room = Room.new
    # @room = Room.all
    @room = "こんにちは"
    # @room = Room.find(params[:room_name])
  end

  def own
  end
  end
end
