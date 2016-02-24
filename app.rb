require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, "sqlite3:barbershop.db"

class Clients < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 2 }
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
	validates :barber, presence: true
end

class Barbers < ActiveRecord::Base
end

class Contacts < ActiveRecord::Base
end

before do
	@barbers = Barbers.order "created_at DESC"

end

get '/' do
	erb :index
end

get '/about' do
	erb :about
end

get '/visit' do
	@c = Clients.new
	erb :visit
end

post '/visit' do


	@c = Clients.new params[:client]
	if @c.save
		erb "<h2>К сожалению, вы записались!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get '/barber/:id' do
	@barber = Barbers.find(params[:id])

	erb :barber
end

get '/showclients' do
	@Clients = Clients.order "created_at DESC"
	erb :showclients
end

get '/contacts' do
	erb :contacts
end