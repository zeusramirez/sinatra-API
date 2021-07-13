require 'json'
require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
  get '/' do
  Restaurant.all.to_json
  end
  # end

  get '/restaurant/:id' do
    restaurant = Restaurant.find(params['id'])
    restaurant.menus.to_json
  end
  
  post '/create_order' do 
    # new_order = Order.create(user_id:params["user_id"], menu_id:params["menu_id"], status:params["status"])
    # new_order.id.to_json
    new_order = params["orders"]
    new_order.map{|item| Order.create(user_id: item["user_id"], menu_id: item["menu_id"], status: item["status"])}
    "Order Received"
  end

  get '/user/:id/orders' do
    orders = User.find(params['id']).orders
    orders.map{|order| {status: order.status, item: order.menu, restaurant: order.menu.restaurant.name, order_id: order.id}}.to_json
  end

  get '/user/:id/account' do
    User.find(params['id']).to_json
  end

  patch '/user/:id/account' do
    user_instructions = User.find(params['id']) 
    user_instructions.delivery_instructions = params["delivery_instructions"]
    user_instructions.save
    "Instructions updated"
  end

  delete '/user/:id/orders/:order_id' do
    delete_order = User.find(params['id']).orders
    delete_order.destroy(params['order_id'])
    "Order Deleted"
  end
end
