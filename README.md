Warsaw
======
![A War Saw](http://freeiconbox.com/icon/256/28394.png)

Warsaw (pronounced 'Varsha') is super light-weight HTTP web service testing tool for custom HTTP test suites. You use Warsha to test your HTTP API service, emulating a real client's behavior. 

Warsaw is written in Ruby (as your test suites will be), but can be used to test any service listening on HTTP. You write your test suites - a succession of GET and POST HTTP calls dictated by your business logic - and assert client has received the correct information after each step. 

Warsaw ships with a sample Node server and test suite, as well as with a test suite for [Barry](github.com/SellaRafaeli/barry), for which it was originally written.

Warsaw is tiny and you are encouraged to browse and understand the entire source code in order to better test suites.

## Installation & Usage 

	$ git clone https://github.com/SellaRafaeli/warsaw
	$ cd warsaw; bundle install
	$ #write test suite and ensure server being tested is running
	$ ruby warsaw <suite_name>

![](http://f.cl.ly/items/400X3X3q0M2G1s161926/Image%202014-10-11%20at%201.18.18%20PM.png)

## Example Node Server
	
	Warsaw ships with an example node server and suite. 
	$ cd warsaw
	$ cd node_sample_service/; npm install; node server
	# new shell
	$ cd warsaw
	$ ruby warsaw node_sample

![](http://f.cl.ly/items/3B1Z0P3e2V0Q2g1T1c1E/Image%202014-10-11%20at%201.16.26%20PM.png)

## Writing a test suite
Test suite's DSL are extremely lightweight and include GET, POST, and assert. An example suite might look like this:

![](http://f.cl.ly/items/2Y2w0t071C0m362P3a2k/Image%202014-10-11%20at%201.24.31%20PM.png)

Included are two example suites which are both language-agnostic. 

## Features
	- get and post JSON
	- cookies used by default

## Copyright 
(c) 2014 Sella Rafaeli under the MIT License. 
