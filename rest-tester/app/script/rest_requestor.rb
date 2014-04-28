require 'rest-client'

print 'Enter controller action [index, new, edit, show]: '
input = gets.chomp
url = 'http://localhost:3000/users/'

case input
# when 'index' then url
when 'new' then url << 'new'
when 'edit' then url << '1/edit'
when 'show' then url << '1'
else
  url  # defaults to root, rather than error
end
puts 'GET REQUEST:'
puts RestClient.get(url)


# Rails doesn't like it when you try to make POST requests to your application 
# using the command line since POST requests typically represent the submission 
# of form data which may be sensitive. The same is true for DELETE and PATCH 
# requests.
url = 'http://localhost:3000/users/'
puts 'POST REQUEST:'
puts RestClient.post(url,'')