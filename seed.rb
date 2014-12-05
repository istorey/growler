require_relative 'app.rb'
 
User.delete(User.all)
Post.delete(Post.all)
 
seed_posts = ["If you don't have anything nice to say come sit closer to me and let's talk about everyone",
	     	  "Every time I don't clog a toilet I feel like I've gotten away with something",
	     	  "Why doesn't the NAACP do anything about how shitty black jelly beans are?",
	     	  "Glue is weird it's all like hey I want to stick these pieces of paper together wait I have an idea hand me that dead horse",
	     	  "I would love to start working out, but I'm beefing up for my \"before\" picture.",
	     	  "I blame my parents subscription to National Geographic when I was a kid for my preference for black women.",
	     	  "Sometimes I wonder if I'm a hoarder and then I think,\"No. But I should probably keep these used band-aids just in case.\"",
	     	  "Nice try, cheese graters, cheese is already great.",
	     	  "I bet people who see Jesus in a grilled cheese sandwich freak out over latte art."
	     	  ].shuffle
 
users = User.create([
	{username: "weston"},
	{username: "trey"},
	{username: "ian"},
	{username: "austin"},
	{username: "andy"}])
 
num_users = users.length
num_posts = seed_posts.length
 
seed_posts.each_with_index do |post, i|
	user_index = i % num_users
	users[user_index].posts.create(body: post)
end