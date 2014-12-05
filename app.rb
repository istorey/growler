require 'pg'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	host: 'localhost',
	database: 'growler_db'
)

class User < ActiveRecord::Base
	has_many :posts

end

class Post < ActiveRecord::Base
	belongs_to :user

end




binding.pry