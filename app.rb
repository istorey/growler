require 'pg'
require 'pry'
require 'active_record'

require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	host: 'localhost',
	database: 'growler_db'
)
def random_color
		color_hex = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
		color = []
		6.times do
			color << color_hex.sample
		end
		color.join("")
end


class User < ActiveRecord::Base
	has_many :posts

end

class Post < ActiveRecord::Base
	belongs_to :user

end

get '/' do 
	@posts = Post.all


	return erb :index
end

get '/users' do
	@users = User.all
	

	return erb :users
end

get '/users/:username' do
	@username = params[:username] 
	user_id = User.find_by(username: @username).id
	@user_posts = Post.where(user_id: user_id)

	return erb :userposts
end

post '/create_user' do
	@username = params[:username] 
	@new_user = User.create(username: @username)
end

post '/create_post' do 
	username = params[:username]
	
	 user = User.find_by(username: username)
	 user.posts.create(body: params[:body])

end

get '/post/:post_id' do
	erb :singlepost

end




