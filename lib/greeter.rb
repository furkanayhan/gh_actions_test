# frozen_string_literal: true

module Greeter
  VERSION = "0.1.0"

  module_function

  def greet(name, shout: false)
    name = name.to_s.strip
    name = "World" if name.empty?
    message = "Hello, #{name}!"
    shout ? message.upcase : message
  end
end
