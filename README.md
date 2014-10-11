Warsaw
======
![A War Saw](http://www.coloringpagebook.com/wp-content/uploads/b-saw-construction-coloring-pages.jpg)

Warsaw (pronounced 'Varsha') is super light-weight HTTP web service testing tool for custom HTTP test suites. You use Warsha to test your HTTP API service, emulating a real client's real behavior. Warsaw is written in Ruby (as your test suites will be), but can be used to test any service listening on HTTP. 

Warsaw ships with a sample Node server and test suite, as well as with a test suite for [Barry](github.com/SellaRafaeli/barry), for which it was originally written.

Warsaw is tiny and you are encouraged to browse and understand the entire source code in order to better test suites.

## Usage 

	$ git clone https://github.com/SellaRafaeli/warsaw
	$ cd warsaw; bundle install
	$ #write test suite and ensure server being tested is running
	$ ruby warsaw suite_name

## Example Node Server
	
	Warsaw ships with an example node server and suite. 
	$ cd warsaw
	$ cd node_sample_service/; npm install; node server
	# new shell
	$ cd warsaw
	$ ruby warsaw node_sample


## Features
	- get and post JSON
	- emulate use of cookies

## Copyright 
(c) 2014 Sella Rafaeli under the MIT License. 