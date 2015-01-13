require './get_or_create_message'

class HelloWorld
  def call(env)
    msg = get_or_create_message

    [
      200,
      {"Content-Type" => "text/html"},
      [msg.message]
    ]
  end
end

run HelloWorld.new
