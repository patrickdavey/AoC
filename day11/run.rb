require './password.rb'

first = PasswordGenerator.new(Password.new("hxbxwxba")).succ
puts PasswordGenerator.new(first).succ
