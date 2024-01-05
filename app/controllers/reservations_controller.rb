class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @q = Room.ransack(params[:q])
    render "rooms/show" if @reservation.invalid?
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.save
      redirect_to :reservations
    else
      @reservation = Reservation.new(reservation_params)
      render :confirm
    end
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
  
  def edit_confirm
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @reservation.attributes = reservation_params
    render :edit if @reservation.invalid?
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    if @reservation.update(reservation_params)
      redirect_to :reservations
    else
      @reservation = Reservation.new(reservation_params)
      render :edit
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path
    else
      render :reservations
    end
  end
  
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id, :fee)
  end
end

