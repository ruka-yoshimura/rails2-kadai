class ReservationsController < ApplicationController
  def index
    # @rooms = Room.all
    # @users = User.all
    # @reservations = Reservation.all
    # @user_id = current_user.id
    @reservations = Reservation.where(user_id: current_user.id)
    # @reservation.price = @reservation.days * @room.fee * @reservation.number_people
    # @reservation.days =  end_date - start_date
    # @days =  end_date - start_date
    # @price = @days * @room.fee * number_people
    # @instances = @rooms | @reservations
    # @price = (@reservation.end_date - @reservation.start_date). * @reservation.room.fee * @reservation.number_people
    # @room = Room.find(params[:id])
    # @reservation = Reservation.new(reservation_params)
    # @reservation = Reservation.new(reservation_params)
    # @room = Room.find(@reservation.room_id)
    # @reservation = Reservation.find(params[:id])
    # @room = @reservation.room
    # @price = @days * @reservation.room.fee * @reservation.number_people
    # @room = Room.find(params[:id])
    # @price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    # @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
  end
  
  def new
    @reservation = Reservation.new(reservation_params)
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    # @reservation = Reservation.find_or_initialize_by(id :params[:id])
    @room = Room.find(@reservation.room_id)
    # @reservation.days =  end_date - start_date
    # @days =  end_date - start_date
    # @price = @days * @room.fee * number_people
    @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    # @price = @days * @reservation.room.fee * @reservation.number_people
    # @reservation = @reservation.price
    # @reservation = @reservation.price
    if @reservation.invalid?
      redirect_to request.referer
    end
    # @days = (@reservation.end_date - @reservation.start_date)
    # @reservations = Reservation.where(user_id: current_user.id)
    # @room = Room.find(@reservation.room_id)
    # @reservation = Reservation.find(params[:id])
  end
  
  def create
    # @room = Room.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    # @price = @days * @reservation.room.fee * @reservation.number_people
    @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    if @reservation.save
      redirect_to :reservations
    else
      render :new
    end
    # @reservation.price = @reservation.days * @room.fee * @reservation.number_people
    # @room = @reservation.room
  end
  
  
  def show
    @reservation = Reservation.find(params[:id])
    # @room = Room.find(@reservation.room_id)
    
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    # @reservation.price = (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
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
    else
      render :edit
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id, :price)
    # params.permit(:start_date, :end_date, :number_people, :user_id, :room_id, :price)
    # params.require(:reservation).permit(:start_date, :end_date, :number_people, :user_id, :room_id)
    # params.require(:reservation).permit(:start_date, :end_date, :number_people)
  end
end