module ApplicationHelper

  def RoomIdArray rooms, current_user
    room_id = []
    rooms.each do |r|
      if current_user
        if current_user.helper_lists.exists?(event_id: r.event_id) || current_user.events.exists?(r.event_id)
          room_id.push(r.id)
        end
      end
    end
    room_id
  end

end
