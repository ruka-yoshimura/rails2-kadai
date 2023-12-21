# class SearchesController < ApplicationController
#   def search
#     @q = Room.ransack(params[:q])
#     @room = @q.result(distinct: true)
#     # @result = params[:q]&.values&.reject(&:blank?)
#   end
# end
