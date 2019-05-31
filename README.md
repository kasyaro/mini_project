# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
MAKE RAILS API: ran in yout terminal : 
rails new mini_app_api --api -d postgresql
than I made a new repo on my git account and connect my mini_app to github.
* Database creation
run in your terminal :
0.  
rails db:create

* Database initialization
there  rae two models in this project: jeans and reviews. 
I created two tables using scaffold.
In my terminal I ran : 
1. 
rails g scaffold coffee name origin notes img price:integer
2. 
rails g scaffold reviews title content author

3. 
rails db:migrate

4. 
seed my data in seeds.rb file : 

I use faker for my project
first I add a : gem 'faker' line to my Gemfile (save it) and run in terminal : bundle
also run : rails db:seed

5. 
to see the database in browser run : rails s
type: localhost:3000/coffees

* Connecting two models with foreign key.
 1. 
 we creating another migration that connect our tables by foreign key. Since Coffee has many reviews we adding a key to reviews.

 run in terminal:
 rails g migration AddForeignKeyToReviews

 2. 
 insede just created file we add a line where reviews => is the name of a column , coffee_id => is the name for our coffe-id , integer: => data type .

add_column :reviews, :coffee_id, :integer
3. 
rails db:migrate

4. 
now we have to connect tables through our models:

models/coffee.rb
models/reviews.rb
******
class Coffee < ApplicationRecord
    has_many :reviews
end
*****
class Review < ApplicationRecord
    belongs_to :coffee
end
*******

* routes set up:
1. 
In my routes.rb I set up my routes for tables : 

Rails.application.routes.draw do
  resources :coffees, only: [:index, :show, :create , :update] do
  resources :reviews, only: [:index , :show, :destroy]
  end 
  end 
2. 
in my file 
1.coffee_controller.rb  => 
we include in our show route reviews. :
1. 
****include our reviews into index route
def index
    @coffees = Coffee.all
    render json: @coffees.to_json(include: :reviews)
  end

********  include our reviews into show route
def show
    render json: @coffee.to_json(include: :reviews)
  end
  ********

2. 
In the file : reviews_controller.rb:

***********we include our coffee into index route
 def index  
    render json: @reviews.to_json(include: :coffee)
  end
  ************ We passing coffee_id as a params here. 
  def create
    @review = Review.new(review_params)
@review.coffee_id = params[:coffee_id]
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

* Postman (creating , updating , destroying)
1.
in terminal run : 
rails routes 
this will show URL for different routes , so that in Postman I will use that URL for my PUT, DESTROY, POST ...
2. 
open a postman application 
since I set up my full CRUD for reviews (excluding only update=PUT)

I was able to create a new review on a route(POST):
 localhost:3000/coffees/4/reviews

get my coffee(id) with reviews (GET) : 
localhost:3000/coffees/4

delete specific review(id) (DELETE), wehere 4 = coffee_id & 49 = review_id:
localhost:3000/coffees/4/reviews/49

(PUT) or update is ran for my coffee product 
localhost:3000/coffees/4/


* Deployment instructions
Uncommented in my Gmfile:
***we need that one for front end ***** 
 1.
 gem 'rack-cors'
2.
uncommented stuff in my config/initializers/cors.rb

*******for fake database***** 
 add: 
 gem 'faker'
 **********
  run in terminal : 
  bundle
**********

* Deploy in HEROKU

first we create file in controllers: 
1.
rails g controller welcome

2.
*******inside welcomecontroller:******** 

class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "Coffee API" }
    end
end 

3. 

add a line in your routes.rb:

root 'welcome#index'

4. 
now push all to github
5. 
now we setting up my back end part on heroku and giving it a name (mini-project-coffee):
heroku create mini-project-coffee
6. 
git push heroku master

7. 
open heroku in a browser=> in terminal run:

heroku open

8. 
than we migrating out database into heroku by running: 

heroku run rails db:migrate

9. 
heroku run rails db:seed

* Touch up for fron end 
in my controllers/coffee_controllers.rb I limit index route to show only 9 coffee out of 50
# GET /coffees
  def index
    @coffees = Coffee.all.sample(9)

    render json: @coffees.to_json(include: :reviews)
  end



