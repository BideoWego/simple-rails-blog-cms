# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create({
	:first => ENV["ADMIN_DEFAULT_FIRST"],
	:last => ENV["ADMIN_DEFAULT_LAST"],
	:email => ENV["ADMIN_DEFAULT_EMAIL"],
	:password => ENV["ADMIN_DEFAULT_PASSWORD"],
	:username => ENV["ADMIN_DEFAULT_USERNAME"]
})

Author.create({
	:first => 'Benjamin',
	:last => 'Franklin',
	:email => 'benjamin@franklin.com',
	:password => ENV["ADMIN_DEFAULT_PASSWORD"],
	:username => 'benjamin_franklin'
})

Author.create({
	:first => 'Achilles',
	:last => 'Heel',
	:email => 'achilles@heel.com',
	:password => ENV["ADMIN_DEFAULT_PASSWORD"],
	:username => 'achilles_heel'
})

Author.create({
	:first => 'Dionysius',
	:last => 'Exiguus',
	:email => 'dionysius@exiguus.com',
	:password => ENV["ADMIN_DEFAULT_PASSWORD"],
	:username => 'dionysius_exiguus'
})

Post.create({
	:author_id => '1',
	:title => 'Code Post',
	:content => '<p>Here is a post with code in it. Made pretty with Google Prettyprint.</p><p>&nbsp;</p>
<div>
<pre class="prettyprint linenums">if@thirsty
have_a_beverage()
puts"Mmmtastybeverage."
else
relax()
puts"I\'dgetupbut...why?"
end</pre>
</div>
<p>&nbsp;&nbsp;</p>
<div>
<pre class="prettyprint linenums">&lt;brdata-mce-bogus="1"&gt;</pre>
</div>
<p>&nbsp;</p>'
})

Post.create({
	:author_id => '1',
	:title => 'Sample Post',
	:content => '<p>Welcome to Simple Blog CMS!</p>'
})

Post.create({
	:author_id => '1',
	:title => 'Older Post',
	:content => '<p>Posted about a year or so ago...</p>',
	:created_at => Date.new(2014,1,4)
})

Post.create({
	:author_id => '1',
	:title => 'Even Older Post',
	:content => '<p>Posted 2 years ago give or take.</p>',
	:created_at => Date.new(2013,1,3)
})

Post.create({
	:author_id => '2',
	:title => 'Much Older Post',
	:content => '<p>Posted on the day the USA declared it\'s independence! Which was before the internet and any relevant technology existed. Cool huh? Makes this post very special!</p>',
	:created_at => Date.new(1776,7,4)
})

Post.create({
	:author_id => '3',
	:title => 'The Trojans Are Comming!',
	:content => '<p>This post was originally posted inside a giant wooden horse. It seemed like such a magnificent gift, yet... something wasn\'t quite right about it.</p>',
	:created_at => Date.new(1200,4,20)
})

Post.create({
	:author_id => '4',
	:title => 'The First Post Ever',
	:content => '<p>Posted on the first day in the A.D. (Anno Domini) era. Blogs are old huh?</p>',
	:created_at => Date.new(0,1,1)
})
