#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'

set :database, {adapter:"sqlite3", database:"pizza.db"}

class Product < ActiveRecord::Base
end

get '/' do 
	@products = Product.all 
	erb :index
	

end

get '/about' do 
	erb :about
end
