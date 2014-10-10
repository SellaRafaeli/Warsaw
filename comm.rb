def get(route, params = {})
	puts "Getting #{route}".blue
	JSON.parse (HTTP.get route, params)
end

def post_json(route, params = {})
	HTTP.post route, json: params
end