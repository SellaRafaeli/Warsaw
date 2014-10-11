$base_url = 'http://localhost:8001'

def test_root
	#sanity
	res = (get '/')
	assert(res.msg == 'hello', 'Base path msg is hello')
end

def test_users
	puts "testing users".yellow
	
	#create user, remember his id and his auth token
	res = (post_json '/users/create', name: 'Moshe')
	user_id = res.id
	
	#get user by that id	
	res = get "/users/id/#{user_id}"
	assert(res._id == user_id, 'set & get user - correct ID')
	assert(res.name == 'Moshe', 'set & get user - correct name')

	#get 'me' - using the cookie received in 'create'
	res = get '/current_user/me'
	assert(res._id == user_id, 'got "me" using cookie')
	
	res = post_json '/current_user/updateMe', data: {city: 'London'}
	res = (get '/current_user/me')
	assert res.city == 'London', "set & get city as London"

	res = post_json '/current_user/updateMe', data: {city: 'Paris'}
	assert (get '/current_user/me').city == 'Paris', "set & get city as Paris"
end

def test_posts
	puts "testing posts".yellow

	#create user
	res = (post_json '/users/create', name: 'TestPoster')
	user_id = res.id

	#create post
	title = get_random_phrase			
	res = post_json '/posts/create', title: title, content: 'foo' 
	post_id = res._id

	#get post by id, verify created correctly
	res = get "/posts/id/#{post_id}"
	assert (res.title == title && res.user_id == user_id), 'post created correctly'

	#update post, verify updated
	new_title = get_random_phrase
	res = post_json "/posts/#{post_id}/update", {data: {title: new_title}}
	res = get "/posts/id/#{post_id}"
	assert (res.title == new_title), 'updating post title'

	#create another post	
	res = post_json '/posts/create', title: 'bar', content: 'foo' 
	post_id2 = res._id
	
	#get current user's posts
	res = get "/posts/user_id/#{user_id}"
	post_ids = res.map {|post| post._id}
	assert ( post_ids.include? post_id) && (post_ids.include? post_id2), 'get both posts by user'
	
end

def run_all
	puts 'running all of Barry...'.yellow

	test_root
	test_users
	test_posts	
end

run_all