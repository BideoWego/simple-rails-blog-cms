class Author < ActiveRecord::Base
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]+\Z/i
	has_secure_password
	has_and_belongs_to_many :posts
	has_and_belongs_to_many :comments
	validates :first,		:presence => true,
							:length => {:maximum => 50}
	validates :last,		:presence => true,
							:length => {:maximum => 50}
	validates :username,	:presence => true,
							:length => {:within => 8..50},
							:uniqueness => true
	validates :email, 		:presence => true,
							:length => {:maximum => 100},
							:format => EMAIL_REGEX
	def name
		{:first => first, :last => last, :full => "#{first} #{last}", :last_first => "#{last} #{first}"}
	end

	def self.guest
		create(:first => 'Guest', :last => 'User', :email => 'guest@user.com', :username => 'guest', :password => 'password')
	end
end
