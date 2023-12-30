class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
  end
  
  def confirm
    # @reservation = Reservation.new(reservation_params)
    @reservation = Reservation.find_or_initialize_by(id: params[:id])
    @reservation.assign_attributes(reservation_params)
    @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    if @reservation.invalid?
      redirect_to request.referer
    end
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    if @reservation.save
      redirect_to :reservations
      # redirect_to("/reservations/#{@reservation.id}")
    else
      render :new
    end
  end
  
  
  def show
    @reservation = Reservation.find(params[:id])
    
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    # @reservation.attributes = reservation_params
    render :edit if @reservation.invalid?
  end
  
  def edit_confirm
    # @reservation = Reservation.find(params[:id])
    # @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    # @room = Room.find(@reservation.room_id)
    # @reservation.attributes = reservation_params
    # render :edit if @reservation.invalid?
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    if @reservation.update(reservation_params)
      redirect_to :reservations
      # redirect_to("/reservations/#{@reservation.id}")
    else
      render :edit
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path, notice: "アウトプットを削除しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render :reservations
    end
  end
  

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id)
    # params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id, :price)
  end
end