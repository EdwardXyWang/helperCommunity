# app/channels/Event_channel.rb
class EventChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber of this channel.
  def subscribed
    puts 'subscribed!!!!!!!!!!!!!!!!!!!!'
    stream_from "events"
  end
end