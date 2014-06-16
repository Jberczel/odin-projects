#Project 1: Building a Simple Kittens API

##Objective

>This is a fast and straightforward project where you'll set up a Rails app to be a data-producing API... which is just a fancy way of saying that all your controller methods will render data instead of HTML. Consider this a drill in quickly building a pure vanilla RESTful resource.

Using RestClient, build a simple app which we can retrieve json:

```
2.0.0-p451 :007 > response = RestClient.get("http://localhost:3000/kittens", :accept => :json)
 => "[{\"id\":1,\"name\":\"Alex\",\"age\":3,\"cuteness\":7,\"softness\":4,\"created_at\":\"2014-06-16T13:03:05.057Z\",\"updated_at\":\"2014-06-16T13:09:58.448Z\"}]"
 ```