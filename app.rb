#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter:"sqlite3", database:"pizza.db"}

class Product < ActiveRecord::Base #model
end

class Order < ActiveRecord::Base
end
get '/' do 
	@products = Product.all 
	erb :index
end

get '/about' do # controller
	erb :about
end

get '/admin' do
  	erb :admin
end

get '/result' do 
	@orders = Order.order('created_at desc')
	erb :result
end

post '/admin' do 
	@orders = Order.order('created_at desc')
	@login = params[:login]
	@pass = params[:password]
	if @login == "admin" && @pass == "secret"
	erb :result
	else 
	@report = '<p><h1>Access denied</h1></p>'
	erb :admin
	end
end


post '/place_order' do
	@order = Order.create params[:order]
	erb :order_placed
end
post '/cart' do 
# получаем список параметров и разбираем их (parse)
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input
#Выводим ссообщение о том что корзина пуста
		if @items.length == 0
			return erb :cart_is_empty
		end
#выводим список продуктов в корзине
	@items.each do |item|
		# id, cnt


		item[0] = Product.find(item[0])
	end
#возвращаем представление по умолчанию
	erb :cart
end

def parse_orders_input orders_input #helper
	s1 = orders_input.split(/,/)
	arr = []	
 	s1.each do |x|
	  s2 = x.split(/\=/)
	   s3 = s2[0].split(/_/)

	 id = s3[1]
	 cnt = s2[1]

	arr2 = [id, cnt]
	arr.push arr2

	end
	return arr
end