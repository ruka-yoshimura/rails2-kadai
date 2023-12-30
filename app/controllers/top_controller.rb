class TopController < ApplicationController
  def index
    @rooms = Room.all
    @q = Room.ransack(params[:q])
    @search_rooms = @q.result
    @rooms_total = Room.all.count(:id)
  end
end
