class RoomsController < ApplicationController

  def index
    @current_user = current_user
    @rooms = Room.all
    @events = Event.all
    @help_lists = HelperList.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.create!(room_params)
    @room.save
  end


  private
    def room_params
      params.require(:room).permit(
        :title,
        :event_id
      )
    end
end
