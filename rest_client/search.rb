require 'rest_client'

print "GOOGLE SEARCH: "
input = gets.chomp
response = RestClient.get 'https://www.google.com/#q=' + input

puts response
