require_relative 'app.rb'

User.all.delete

users = User.create([
	{username: "weston"},
	{username: "trey"},
	{username: "ian"},
	{username: "austin"},
	{username: "andy"}])


