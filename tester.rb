require 'bundler'
require './helpers'
Bundler.require

$base_url = 'http://localhost:8001'

def bp
	binding.pry
end

def full_route(relative_route)
	"#{$base_url}#{relative_route}"
end

def get(route, params = {})	
	puts "Getting #{route}".blue
	JSON.parse (HTTP.get full_route(route), params)
end

def post_json(route, params = {})
	puts "Posting #{route} with params #{params}".light_blue
	JSON.parse (HTTP.post full_route(route), json: params)
end

def assert(cond, msg = "<msg missing>")
	$assert_counter ||= 0
	$assert_counter +=  1
	line = cond ? msg.green : "Failed on #{msg}".red
	line = "[#{$assert_counter}] #{line}"
	puts line
end

#======= Your code here ========


def run_all
	puts 'running all...'.yellow

	#sanity
	res = (get '/')
	assert(res.msg == 'hello', 'Base path msg is hello')

	#create user, get his id
	res = (post_json '/users/create', name: 'Moshe')
	user_id = res.id

	#get user by that id	
	res = get "/users/id/#{user_id}"
	assert(res._id == user_id, 'set & get user - correct ID')
	assert(res.name == 'Moshe', 'set & get user - correct name')

	
end

run_all

