## Warmup Project: Sending Params with RestClient

**Background:**
In this project, you'll get a chance to interact with a Rails application from the command line by sending requests manually. You'll first build a very simple app (to get some practice with the steps involved in creating a new one) and then a simple script which uses the RestClient gem (which you used in the first project) to send some requests and examine the server output.

**Objective:**
* Create simple Rails app. Create controllers, configure routing, and create views. 
* Next create a simple script file which will run RestClient and allow you to start pinging your new app.
* Check status of requests and examine server output.


Sample Output from running `app/script/rest_requester.rb`:
```
jamies-air:script jxberc$ ruby rest_requestor.rb
Enter controller action [index, new, edit, show]: new
GET REQUEST:
<!DOCTYPE html>
<html>
<head>
  <title>RestTester</title>
  <link data-turbolinks-track="true" href="/assets/application.css?body=1" media="all" rel="stylesheet" />
<link data-turbolinks-track="true" href="/assets/users.css?body=1" media="all" rel="stylesheet" />
  <script data-turbolinks-track="true" src="/assets/jquery.js?body=1"></script>
<script data-turbolinks-track="true" src="/assets/jquery_ujs.js?body=1"></script>
<script data-turbolinks-track="true" src="/assets/turbolinks.js?body=1"></script>
<script data-turbolinks-track="true" src="/assets/users.js?body=1"></script>
<script data-turbolinks-track="true" src="/assets/application.js?body=1"></script>
  <meta content="authenticity_token" name="csrf-param" />
<meta content="4mhLwRoq6gWfTwdTSZMt+9XIZnqgmBJWHayPbleGYQQ=" name="csrf-token" />
</head>
<body>

 <h1>I am the new action.</h1>

</body>
</html>
POST REQUEST:
/Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/abstract_response.rb:48:in `return!': 422 Unprocessable Entity (RestClient::UnprocessableEntity)
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/request.rb:230:in `process_result'
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/request.rb:178:in `block in transmit'
  from /Users/jxberc/.rvm/rubies/ruby-2.0.0-p451/lib/ruby/2.0.0/net/http.rb:852:in `start'
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/request.rb:172:in `transmit'
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/request.rb:64:in `execute'
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient/request.rb:33:in `execute'
  from /Users/jxberc/.rvm/gems/ruby-2.0.0-p451/gems/rest-client-1.6.7/lib/restclient.rb:72:in `post'
  from rest_requestor.rb:25:in `<main>'
```

**Note:** Rails doesn't like it when you try to make POST requests to your application using the command line since POST requests typically represent the submission of form data which may be sensitive. 


Sample Output from local dev logs:
```
jamies-air:rest-tester jxberc$ rails s
=> Booting WEBrick
=> Rails 4.0.4 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2014-04-28 13:01:59] INFO  WEBrick 1.3.1
[2014-04-28 13:01:59] INFO  ruby 2.0.0 (2014-02-24) [x86_64-darwin13.0.0]
[2014-04-28 13:01:59] INFO  WEBrick::HTTPServer#start: pid=28703 port=3000


Started GET "/users/new" for 127.0.0.1 at 2014-04-28 13:02:45 -0400
Processing by UsersController#new as XML
  Rendered users/new.html.erb within layouts/application (2.0ms)
Completed 200 OK in 88ms (Views: 79.3ms | ActiveRecord: 0.0ms)


Started POST "/users/" for 127.0.0.1 at 2014-04-28 13:02:45 -0400
Processing by UsersController#create as XML
Can't verify CSRF token authenticity
Completed 422 Unprocessable Entity in 1ms

ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken):
  actionpack (4.0.4) lib/action_controller/metal/request_forgery_protection.rb:166:in `handle_unverified_request'
  actionpack (4.0.4) lib/action_controller/metal/request_forgery_protection.rb:173:in `handle_unverified_request'
  actionpack (4.0.4) lib/action_controller/metal/request_forgery_pro
```


