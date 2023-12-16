class RoomsController < ApplicationController


  def index
    @rooms = Room.all
  end

  def new
    # params.permit(:room_img, :room_name, :room_detail, :fee, :address)
    @room = Room.new
    # @room = Room.all
    @room = "こんにちは"
    # @room = Room.find(params[:room_name])
  end

  def create
    @room = Room.new(room_params)
        if @room.save
            render 'index'
        else
            render 'new'
        end
  end


  def own
  end

  private
        def room_params
            params.require(:room).permit(:room_name, :room_detail, :room_img, :fee, :address)
        end
end
