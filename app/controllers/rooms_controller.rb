class RoomsController < ApplicationController
  

  def index
    @rooms = Room.all
    @users = User.all
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
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
    end
    
    def edit
      @room = Room.find(params[:id])
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
      # @room = Room.find(params[:id])
      # @room.destroy
      # redirect_to "rooms/own"
    end
    
    def own
      @rooms = Room.where(user_id: current_user.id)
      @q = current_user.rooms.ransack(params[:q])
	    # @rooms = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
	    # @rooms = @q.result(distinct: true).includes(:user).order(created_at: :desc).room(params[:room_params])
    end

    def search
      @q = Room.ransack(params[:q])
      @search_rooms = @q.result
    end

    private
    def room_params
      params.require(:room).permit(:room_name, :room_detail, :fee, :address, :room_img, :user_id)
    end
end
