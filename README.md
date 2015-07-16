# Simple Blog CMS

A simple blog cms with admin dashboard complete with TinyMCE for posts.

Working features:

* admin dashboard
* crud
	* authors
	* posts
	* comments
* display most recent posts
* navigate posts by year
* comment on posts as guest
* code snippets in posts with syntax highlighting

Installation requires PostgreSQL with the current config. However, this can be changed to simply use SQLite3 in the `/config/database.yml` file

Change the `default:` section to:

	default: &default
	  adapter: sqlite3
	  pool: 5
	  timeout: 5000

Change the `development:` section to:

	development:
	  <<: *default
	  database: db/simple_blog_cms_development.sqlite3

Then run:

	$ bundle install
	$ rake db:setup
	$ rails s

View the project locally at `http://localhost:3000`