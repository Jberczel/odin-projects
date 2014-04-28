## Web Server and Browser (from the command line)

**Objective:** build a simple Ruby web server that receives requests and sends a response based on those requests. Also create a simple browser client to issue those requests.


**My Solution:**

In one tab of your terminal, run `server.rb`.

In another tab run `browser.rb`.

The command line browser will interact with server to either get `index.html`, or post to `thanks.html`.

Sample output for GET request:

```
jamies-air:sockets jxberc$ ruby browser.rb
What type of request do you want to submit [GET, POST]? GET

<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <h1>Welcome to my personal Homepage</h1>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, incidunt et maiores illo voluptatibus quia non quidem numquam fugiat pariatur aliquam molestias nemo ipsam deserunt est dolores corporis. Facilis, voluptas!</p>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatum, iste, deleniti, aliquam velit est porro tenetur animi officia consequatur excepturi laborum dolores dolor dignissimos? Officiis consequuntur neque soluta asperiores nostrum.</p>
</body>
</html>
```

Sample output for POST request:

```
jamies-air:sockets jxberc$ ruby browser.rb
What type of request do you want to submit [GET, POST]? POST
Enter name: Jeremiah
Enter e-mail: jjohnson@email.com

<html>
  <body>
    <h1>Thanks for Posting!</h1>
    <h2>Here's what we got from you:</h2>
    <ul>
      <li>name: Jeremiah</li><li>e-mail: jjohnson@email.com</li>
    </ul>
  </body>
</html>
```
