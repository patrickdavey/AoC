require 'pry'
require 'digest'

secret_key = 'iwrupvqb'
modifier = -1
result = ""

loop do
  modifier = modifier + 1
  result = "#{secret_key}#{modifier}"
  break if Digest::MD5.hexdigest(result).start_with?('000000')
end
puts result
