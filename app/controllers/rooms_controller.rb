class RoomsController < ApplicationController
  

  def index
    @rooms = Room.all
    # @users = User.all
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
    @rooms_total = Room.all.count(:id)
    # @reservations = Reservation.all
    # @reservations = Reservation.where(user_id: current_user.id)
  end
  
  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to("/rooms/#{@room.id}")
    else
      render :new
    end
  end
  
  def show
    @room = Room.find(params[:id])
    # @room = @reservation.room
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
    # @room = @room_id.reservations.build
    # @room = current_user.rooms.build
    # @reservation = @room.id.reservations.build
    # @room = Room.new(room_params)
    @reservation = current_user.reservations.build
    # @reservation =  Reservation.new
    # @reservations =  @room.reservations
    end
    
    def edit
      @room = Room.find(params[:id])
      @q = Room.ransack(params[:q])
    end
    
    def update
      @room = Room.find(params[:id])
      if @room.update(room_params)
        redirect_to("/rooms/#{@room.id}")
      else
        render :new
      end
    end
    
    def destroy
      @q = Room.ransack(params[:q])
      @room = Room.find(params[:id])
      if @room.destroy
        redirect_to rooms_path, notice: "アウトプットを削除しました"
      else
        flash.now[:danger] = "削除に失敗しました"
        render :own
      end
    end
    
    def own
      @rooms = Room.where(user_id: current_user.id)
      @q = current_user.rooms.ransack(params[:q])
    end

    def search
      @q = Room.ransack(params[:q])
      @search_rooms = @q.result
    end
    
    private
    def room_params
      params.require(:room).permit(:room_name, :room_detail, :fee, :address, :room_img, :user_id)
      # params.permit(:room_name, :room_detail, :fee, :address, :room_img, :user_id)
    end
end
