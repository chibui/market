class ItemsChannel < ActionCable::Channel::Base
  def subscribed
    stream_from "items"
  end
end
