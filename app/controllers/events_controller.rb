class EventsController < ApplicationController

  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    @event.user_id = current_user.id if current_user

    if @event.save
      #render json:@event
      redirect_to @event
    else
      render json:{ result: 'failed to save', errors: @event.errors.full_messages }, status: 400
    end
  end

  def accept_event
    @event = Event.find(params[:id])
    @event.users << current_user
    # puts current_user.phone_number
    # kind of like event.users.push(current_user) & save to db
    # render text: "Thank you! You will receive an SMS shortly."

    # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: current_user.phone_number,
        body: "#{current_user.name} has accepted your event."
      )
    redirect_to :event
  end


  private
    def event_params
      params.require(:event).permit(
        :title,
        :description,
        :photo,
        :scheduled_at,
        :address,
        :end_address,
        :city
      )
    end
end