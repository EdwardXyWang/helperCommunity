module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :current_user

    def connect
      puts 'connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
      # self.current_user = find_verified_user
    end
# Currently actioncable is not able to define cookies.signed.
    # private
    #   def find_verified_user
    #     puts cookies.signed[:user_id]
    #     if current_user = User.find_by(id: cookies.signed[:user_id])
    #       current_user
    #     else
    #       reject_unauthorized_connection
    #     end
    #   end
  end
end
