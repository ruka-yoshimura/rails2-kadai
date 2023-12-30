class RoomsController < ApplicationController
  

  def index
    @rooms = Room.all
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
    @rooms_total = Room.all.count(:id)
  end
  
  def new
    @room = current_user.rooms.build
  end
  
  def create
    @room = Room.new(room_params)
    @room.room.img = "app/assets/images/default-image-4e0ac6b8d01335b5b22fe6586af13644ae51dddb6aeabf35b9174e80f13cd09d.png"
    if @room.save
      redirect_to("/rooms/#{@room.id}")
    else
      render :new
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
    @reservation = current_user.reservations.build
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
        render :edit
      end
    end
    
    def destroy
      @q = Room.ransack(params[:q])
      @room = Room.find(params[:id])
      if @room.destroy
        redirect_to :rooms, notice: "アウトプットを削除しました"
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
      @rooms_area_total = @q.result.count
    end
    
    private
    def room_params
      params.require(:room).permit(:room_name, :room_detail, :fee, :address, :room_img, :user_id)
    end
end
