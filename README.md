## Practice with Passing Data with Sinatra

In this workshop, we're going to practice passing data between a client and a Sinatra server.

Remember, there are a few different ways to pass data. We'll be focus on passing data via query params (in the url) and via forms.

## Query String Parameters

#### Activity 1

You'll see a route defined in `shopping_app.rb` that handles requests to the root (`/`). It's looking for a "name" in the `params`. 

Add something to the url to make the name added in the url appear on the page. Do **NOT** change any code in the `index.erb` view.

If you're stuck, research query string parameters. If you're still stuck, scroll down to the bottom for help.

#### Activity 2

Next, create a route that handles `GET` requests to `/cart` (in your server file - `shopping_app.rb`) that renders the `views/cart.erb` view template after setting the instance variables necessary. You'll need to pass query string parameters in your url with keys of `item` and `price`. Do **NOT** change the code in the `cart.erb` view template.

Again, if you're stuck - attempt to do some research on your own, then check the "Hints" section.

## Form Parameters

#### Activity 1

Take a look in `views/new_item.erb`. You'll see an existing form. Can you identify what each piece of the form does? What currently happens when you launch the server, visit `/items/new`, and try to submit the form?

Modify the code in the route that handles this request so that the data a user enters in the form is shown on the page after submission.

#### Activity 2

You'll see a route in your `shopping_app.rb` to `get '/users/new'` that renders a view template that's blank. Create a form in this file that will accept a username and password.

Create a route that handles the submission of this form (a `POST` to `/users`). Then, create a view that displays the submitted data.

## Hints

### Query String Parameters

#### Activity 1

After you launch you're server, type in `localhost:4567/?name=YourNameHere`. The `?` indicates that the data following will be query params. Then, we add key/value pairs using `=` and separate multiple pieces of data with `&`.

#### Activity 2

We need to first create a route to handle this request:

```ruby
# shopping_app.rb

get '/cart' do

end
```

Then, we'll need to assign the instance variables requested:

```ruby
# shopping_app.rb

get '/cart' do
  @item = params["item"]
  @price = params["price"]
end
```

The above params need to be passed in through the url like so: `localhost:4567/cart?item=Apple&price=4.50`

Then, we'll need to render the correct view:

```ruby
# shopping_app.rb

get '/cart' do
  @item = params["item"]
  @price = params["price"]

  erb :cart
end
```

### Form Parameters

#### Activity 1

The `name` attribute on the `input` tags in `views/new_item.erb`. We can access these keys within `params` to pull the data that was submitted via the form.

```ruby
post '/items' do
  @item = params["item"]
  @price = params["price"]

  erb :cart
end

```

#### Activity 2

In `views/new_user.erb`, let's create a form:
```erb
<form method="POST" action="/users">
  Username: <input type="text" name="username">
  Password: <input type="text" name="password">
  <input type="submit" value="Submit">
</form>
```

In our `shopping_app.rb`, we'll define the route that accepts this data then renders a new view.

```ruby
# shopping_app.rb

post '/users' do
  @username = params["username"]
  @password = params["password"]

  erb :user
end
```

In your `views/user.erb`, you can access `@username` and `@password` and display this data!
