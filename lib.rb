require 'bundler'
Bundler.require

# helpers
def bp
	binding.pry
end

class Hash # enable Hash dot access. x={a:1}; x.a==1; x.b=2; x.b==2;
  def method_missing(method, *args)
    if method =~ /=$/
      self[$`.to_sym] = args[0]
    else
      self[method.to_sym] || self[method.to_s]
    end
  end
end

def get_random_phrase
	RandomWord.adjs.next + " " + RandomWord.nouns.next
end
	
# comm
$http = HTTPClient.new

def full_route(relative_route)
	"#{$base_url}#{relative_route}"
end

def parse_http_response(res)	
	JSON.parse res.body
rescue => e
	{warsaw_parsing_error: e.to_s}
end

def get(route, params = {})	
	puts "Getting #{route}".blue
	parse_http_response ($http.get full_route(route), params)
end

def post_json(route, params = {})
	puts "Posting #{route} with params #{params}".light_blue	
	parse_http_response ($http.post full_route(route), params.to_json, "Content-Type" => "application/json")
end

# testing
$assert_counter = 0

def assert(cond, msg = "<msg missing>")	
	$assert_counter += 1
	line = cond ? msg.green : "*** Failed *** on #{msg}".red
	line = "[#{$assert_counter}] #{line}"
	puts line
end