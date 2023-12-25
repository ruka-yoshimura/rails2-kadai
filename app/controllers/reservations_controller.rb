class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @users = User.all
    @reservations = Reservation.all
    # @reservations = Reservation.where(room_id: @room.id)
    # @instances = @rooms | @reservations
  end
  
  def new
  #   @reservation = Reservation.new
  #   @room = Room.find(params[:id])
  end

  def confirm 
    # @reservation = Reservation.new(reservation_params)
    @reservation = Reservation.find(params[:id])
    # @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:room_id])
    @user_id = current_user.id
  end
  
  def create
    # @room = Room.find(params[:id])
    # @room = @reservation.room
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to :reservations
    else
      render :new
    end
  end
  
  def show
    @reservations = Reservation.where(user_id: current_user.id)
    @room = Room.find(params[room_id])
    @reservation = Reservation.find(params[:id])
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id)
    # params.require(:reservation).permit(:start_date, :end_date, :number_people)
  end
end