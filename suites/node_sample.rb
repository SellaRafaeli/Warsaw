$base_url = 'http://localhost:3000'

def test_root
	#sanity
	res = (get '/')
	assert(res.msg == 'hello_node', 'Base path msg is hello_node')

	res = post_json '/add_two', {val:5}
	assert res.new_val == 7, 'adding two to value'
end

def run_all
	puts 'running tests for Node Sample Service...'.yellow

	test_root
end

run_all