require './message'

def get_or_create_message
  Message.first_or_create(message: "Hello at #{Time.now_to_i}")
end
